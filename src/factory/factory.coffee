walkTo = (loc) ->
  return if poly.playerDistanceTo loc < 5

  cameraTowards loc
  while poly.playerDistanceTo(loc) > 5
    walkTowards loc
    await setTimeout defer(), 250
  console.log 'Here!'

walkTowards = (loc) ->
  # Check to see if the location is on the screen
  if poly.locOnScreen loc
    driver.clickWorld loc
    return

  # Otherwise calculate the direction to walk and go that way
  playerLoc = poly.playerLoc()
  dir = vector.sub loc, playerLoc
  dirN = vector.div dir, vector.len dir
  dirLoc = vector.add playerLoc, dirN

  playerPixel = poly.worldToScreen playerLoc
  dirPixel = poly.worldToScreen dirLoc

  #get a vector pointing in the direction
  d = vector.sub dirPixel, playerPixel

  # normalize
  len = vector.len d
  dn = vector.div d, len
  d = vector.mul dn, 50

  #find a pixel in that direction close to the edge of the screen
  size = poly.screenSize()

  pixel = playerPixel
  while poly.pixelOnScreen pixel
    pixel = vector.add pixel, d

  # move back to find one on screen
  pixel = vector.sub pixel, vector.mul(dn, 50)

  # console.log pixel
  driver.clickScreen pixel

cameraTo = (angle) ->
  angDiff = vector.constrainAngle(angle - poly.cameraAngle())
  while Math.abs(angDiff) > 0.2
    direction = if angDiff < 0 then 'left' else 'right'
    driver.checkFocus()
    driver.sendKey 'down', direction
    await setTimeout defer(), 100
    driver.sendKey 'up', direction
    angDiff = vector.constrainAngle(angle - poly.cameraAngle())
  console.log 'Facing direction!'

cameraTowards = (loc) ->
  cameraTo vector.angle vector.sub loc, poly.playerLoc()

walkLoc = (loc) ->
  driver.clickWorld loc

@polyFactory =
  go: cameraTo

  go2: cameraTowards

  go3: walkTo

  test: ->
    driver.checkFocus()
    driver.sendKey 'down', 'left'
    await setTimeout defer(), 1000
    driver.sendKey 'up', 'left'



# entity manager
# resource despenser managers
# game space map
