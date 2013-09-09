console.log 'PolyFactory started!'

waitForLoad = ->
  #Wait until the game engine has loaded enough to have a hero loaction
  while not CrashMob?.globals?.gameManager?.heroEntity?.v3Location?
    await setTimeout defer(), 1000
  status.setup()

northPixel = ->
  loc = poly.playerLoc()
  north = loc[..]
  north[0] += 5
  pixel = poly.worldToScreen north
  poly.screenToClient pixel

walkNorth = ->
  northClient = northPixel()

  if not poly.isFocused()
    poly.$canvas().simulate 'mousedown'

  poly.$canvas().simulate 'mousemove', {
    clientX: northClient[0], clientY: northClient[1]
  }
  poly.$canvas().simulate 'mousedown'
  poly.$canvas().simulate 'mouseup'

@polyFactory =
  go: walkNorth

$(document).ready waitForLoad

# entity manager
# resource despenser managers
# game space map
