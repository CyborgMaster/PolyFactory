walkNorth = ->
  playerLoc = poly.playerLoc()
  north = playerLoc[..]
  north[0] += 1

  playerPixel = poly.worldToScreen playerLoc
  northPixel = poly.worldToScreen north

  #get a vector pointing in the direction
  dx = northPixel[0] - playerPixel[0]
  dy = northPixel[1] - playerPixel[1]

  # normalize to length of 100 pixels
  len = Math.sqrt(Math.abs(dx * dx + dy * dy))
  dx = (dx / len) * 200
  dy = (dy / len) * 200

  #find a pixel in that direction close to the edge of the screen
  size = poly.screenSize()
  console.log size

  pixel = playerPixel
  while 0 < pixel[0] < size[0] and 0 < pixel[1] < size[1]
    pixel[0] += dx
    pixel[1] += dy

  # move back to find one on screen
  pixel[0] -= dx
  pixel[1] -= dy

  console.log pixel

  driver.clickScreen pixel


@polyFactory =
  go: walkNorth

# entity manager
# resource despenser managers
# game space map
