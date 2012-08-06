jQuery ->
  window.trails = $('#tripmeter').data('trails')
  window.locations = $('#tripmeter').data('locations')
  window.user = $('#tripmeter').data('user')

window.onload = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition setTrail, showError, enableHighAccuracy: true
    navigator.geolocation.watchPosition showCurrentPos, showError, enableHighAccuracy: true
  else
    document.write "Your device cannot be located"

showCurrentPos = (position) ->
  lat = position.coords.latitude
  lon = position.coords.longitude
  document.getElementById("currentLat").innerHTML = lat
  document.getElementById("currentLon").innerHTML = lon

  if isInArea(position, window.endpoint[0], window.endpoint[1])
    clearInterval(window.timer)
    subButton = document.getElementById('submitButton')
    subButton.style.display = "block"
    subButton.innerHTML = "Submit Your Time!"
    subButton.onclick = ->
      $.post(
        "/timings"
        timing: { user_id: window.user.id, trail_id: window.trail.id, seconds: window.elapsed }
        success: alert 'hooray for ajax!'
      )
      true
    true

setTrail = (position) ->
  for trail in window.trails
    if atTrail(position, trail)
      timerStart(position, trail)

timerStart = (position, trail) ->
  window.trail = trail
  document.getElementById("trailName").innerHTML = trail.name
  startButton = document.getElementById("startButton")
  startButton.onclick = ->
    start = new Date().getTime()
    window.timer = setInterval ->
                     clock(start)
                  , 100
    this.disabled = true
  startButton.innerHTML = "Begin timing"


atTrail = (position, trail) ->
  trailLocs = ([loc.latitude, loc.longitude] for loc in window.locations when loc.trail_id is trail.id)
  if isInArea(position, trailLocs[0][0], trailLocs[0][1])
    window.endpoint = trailLocs[1]
  else if isInArea(position, trailLocs[1][0], trailLocs[1][1])
    window.endpoint = trailLocs[0]
  else
    false

isInArea = (position, cenLat, cenLon) ->
  posLat = position.coords.latitude
  posLon = position.coords.longitude
  squareDist = Math.pow(cenLat - posLat, 2) + Math.pow(cenLon - posLon, 2)
  squareDist <= Math.pow(0.0005, 2)

clock = (start) ->
  time = new Date().getTime() - start
  window.elapsed = Math.floor(time / 1000)
  document.getElementById('timer').innerHTML = window.elapsed

showError = (error) ->
  alert "Error occurred. Error code: " + error.code
  # error.code can be:
  #   0: unknown error
  #   1: permission denied
  #   2: position unavailable (error response from locaton provider)
  #   3: timed out
