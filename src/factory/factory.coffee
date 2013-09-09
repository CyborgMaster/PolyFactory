console.log 'PolyFactory started!'

waitForLoad = ->
  #Wait until the game engine has loaded enough to have a hero loaction
  while not CrashMob?.globals?.gameManager?.heroEntity?.v3Location?
    await setTimeout defer(), 1000
  status.setup()

walkNorth = ->
  loc = poly.playerLoc()
  console.log loc
  north = loc[..]
  console.log north
  north[0] += 5
  console.log north
  northPixel = poly.worldToScreen north
  console.log northPixel
  northClient = poly.screenToClient northPixel
  console.log northClient

  poly.$canvas().simulate 'mousedown'
  await setTimeout defer(), 200
  poly.$canvas().simulate 'mousemove', {
    clientX: northClient[0], clientY: northClient[1]
  }
  #await setTimeout defer(), 200
  #poly.$canvas().simulate 'mousedown'
  await setTimeout defer(), 200
  poly.$canvas().simulate 'mouseup'

@polyFactory =
  go: walkNorth

$(document).ready waitForLoad

# entity manager
# resource despenser managers
# game space map
