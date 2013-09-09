walkTo = (loc) ->
  console.log poly.playerDistanceTo loc
  while poly.playerDistanceTo(loc) > 5
    console.log 'Walking...'
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
  # console.log len
  dn = vector.div d, len
  # console.log dn
  d = vector.mul dn, 50
  # console.log d

  #find a pixel in that direction close to the edge of the screen
  size = poly.screenSize()

  pixel = playerPixel
  while poly.pixelOnScreen pixel
    pixel = vector.add pixel, d

  # move back to find one on screen
  pixel = vector.sub pixel, vector.mul(dn, 50)

  # console.log pixel
  driver.clickScreen pixel


walkLoc = (loc) ->
  driver.clickWorld loc

@polyFactory =
  go: walkTowards

  go2: walkTo

  test: ->
    driver.sendKey 'down', 'left'
    await setTimeout defer(), 1000
    driver.sendKey 'up', 'left'



# entity manager
# resource despenser managers
# game space map
