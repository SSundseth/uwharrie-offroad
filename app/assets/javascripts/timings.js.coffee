window.exports ||= {}
window.exports = ->

  jQuery ->
    window.trails = $('#tripmeter').data('trails')
    window.locations = $('#tripmeter').data('locations')
    window.user = $('#tripmeter').data('user')

  window.onload = ->
    if navigator.geolocation
      navigator.geolocation.watchPosition watchPos, showError, enableHighAccuracy: true
    else
      document.write "Your device cannot be located"

  watchPos = (position) ->
    lat = position.coords.latitude
    lon = position.coords.longitude
    document.getElementById("currentLat").innerHTML = lat
    document.getElementById("currentLon").innerHTML = lon

    if window.endpoint
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
    else
      for trail in window.trails
        if atTrail(position, trail)
          timerStart(position, trail)
          break
        else
          document.getElementById("startButton").onclick = -> false
          document.getElementById("trailName").innerHTML = '???'


  timerStart = (position, trail) ->
    window.trail = trail
    document.getElementById("trailName").innerHTML = trail.name
    startButton = document.getElementById("startButton")
    startButton.onclick = ->
      window.endpoint = window.temp
      start = new Date().getTime()
      window.timer = setInterval ->
                       clock(start)
                    , 100
      this.disabled = true

  atTrail = (position, trail) ->
    trailLocs = ([loc.latitude, loc.longitude] for loc in window.locations when loc.trail_id is trail.id)
    if isInArea(position, trailLocs[0][0], trailLocs[0][1])
      window.temp = trailLocs[1]
    else if isInArea(position, trailLocs[1][0], trailLocs[1][1])
      window.temp = trailLocs[0]
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
    hours = Math.floor( window.elapsed / 3600 )
    minutes = Math.floor( (window.elapsed - hours * 3600) / 60 )
    seconds = window.elapsed - (hours * 3600 + minutes * 60)

    document.getElementById('hours').innerHTML = addZero hours
    document.getElementById('minutes').innerHTML = addZero minutes
    document.getElementById('seconds').innerHTML = addZero seconds

  addZero = (num) ->
    if num.toString().length < 2 then "0" + num.toString() else num.toString()

  showError = (error) ->
    switch error.code
      when 0 then alert 'Unknown Error'
      when 1 then alert 'Permission Denied'
      when 2 then alert 'Your position is unavailable'
      when 3 then alert 'Operation timed out'
    # error.code can be:
    #   0: unknown error
    #   1: permission denied
    #   2: position unavailable (error response from locaton provider)
    #   3: timed out
