walkNorth = ->
  playerLoc = poly.playerLoc()
  north = playerLoc[..]
  north[0] += 1

  playerPixel = poly.worldToScreen playerLoc
  northPixel = poly.worldToScreen north

  #get a vector pointing in the direction
  d = vector.sub northPixel, playerPixel

  # normalize
  len = vector.len d
  console.log len
  dn = vector.div d, len
  console.log dn
  d = vector.mul dn, 50
  console.log d

  #find a pixel in that direction close to the edge of the screen
  size = poly.screenSize()

  pixel = playerPixel
  while 0 < pixel[0] < size[0] and 0 < pixel[1] < size[1]
    pixel = vector.add pixel, d

  # move back to find one on screen
  pixel = vector.sub pixel, vector.mul(dn, 150)

  console.log pixel
  driver.clickScreen pixel


@polyFactory =
  go: walkNorth

# entity manager
# resource despenser managers
# game space map
