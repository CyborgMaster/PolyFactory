walkNorth = ->
  north = poly.playerLoc()[..]
  north[0] += 5
  clickWorld north

clickWorld = (loc) ->
  pixel = poly.worldToClient loc
  if not poly.isFocused()
    poly.$canvas().simulate 'mousedown'
  poly.$canvas().simulate 'mousemove', {
    clientX: pixel[0], clientY: pixel[1]
  }
  poly.$canvas().simulate 'mousedown'
  poly.$canvas().simulate 'mouseup'

@polyFactory =
  go: walkNorth

# entity manager
# resource despenser managers
# game space map
