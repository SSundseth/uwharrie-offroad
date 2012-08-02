jQuery ->
  window.trails = $('#tripmeter').data('trails')
  window.locations = $('#tripmeter').data('locations')
  window.user = $('#tripmeter').data('user')

clock = (start) ->
  time = new Date().getTime() - start
  elapsed = Math.floor(time / 1000)
  document.getElementById('timer').innerHTML = elapsed

isInArea = (position, cenLat, cenLon) ->
  posLat = position.coords.latitude
  posLon = position.coords.longitude
  squareDist = Math.pow(cenLat - posLat, 2) + Math.pow(cenLon - posLon, 2)
  squareDist <= Math.pow(0.0005, 2)


showError = (error) ->
  alert "Error occurred. Error code: " + error.code
  # error.code can be:
  #   0: unknown error
  #   1: permission denied
  #   2: position unavailable (error response from locaton provider)
  #   3: timed out

showCurrentPos = (position) ->
  lat = position.coords.latitude
  lon = position.coords.longitude
  document.getElementById("currentLat").innerHTML = lat
  document.getElementById("currentLon").innerHTML = lon

  if isInArea(position, vigLat, vigLon)
    document.getElementById("atViget").innerHTML = "YES!"
    document.getElementById("startButton").onclick = ->
      start = new Date().getTime()
      window.timer = setInterval ->
                       clock(start)
                    , 100
      this.disabled = true
    document.getElementById("startButton").innerHTML = "Begin timing"
  else
    document.getElementById("atViget").innerHTML = "NO!"

  if isInArea(position, homeLat, homeLon)
    document.getElementById("atHome").innerHTML = "YES!"
    clearInterval window.timer
    total = new Date().getTime() - start
    $.ajax '/timings',
        type: 'POST'
        dataType: 'html'
        data: {timing: {user_id: window.user, trail_id: 90, seconds: total}}
        success: $('body').append "Successful AJAX call: #{data}"
  else
    document.getElementById("atHome").innerHTML = "NO!"

homeLat = 35.974551
homeLon = -78.99481
vigLat = 35.997105
vigLon = -78.899893

window.onload = ->
  if navigator.geolocation
    navigator.geolocation.watchPosition showCurrentPos, showError,
      enableHighAccuracy: true

  else
    document.write "Your device cannot be located"
