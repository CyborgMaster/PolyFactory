driver =
  clickWorld: (loc) ->
    @clickScreen poly.worldToScreen loc

  clickScreen: (pixel) ->
    @clickClient @screenToClient pixel

  clickClient: (pixel) ->
    @checkFocus()
    @click pixel

  click: (pixel) ->
    poly.$canvas().simulate 'mousemove', {
      clientX: pixel[0], clientY: pixel[1]
    }
    poly.$canvas().simulate 'mousedown'
    poly.$canvas().simulate 'mouseup'

  sendKey: (dir, key) ->
    key = switch key
      when 'left'
        $.simulate.VK_LEFT
      when 'right'
        $.simulate.VK_RIGHT

    @checkFocus()

    poly.$canvas().simulate "key#{dir}", {
      keyCode: key
    }

  checkFocus: ->
    if not poly.isFocused()
      @click @screenToClient poly.worldToScreen poly.playerLoc()
      poly.$canvas().focus()


  screenToClient: (point) ->
    $canvas = poly.$canvas
    offset_t = $canvas().offset().top - $(window).scrollTop()
    offset_l = $canvas().offset().left - $(window).scrollLeft()
    [point[0] + offset_l, point[1] + offset_t]

  walkTo: (loc) ->
    return if poly.playerDistanceTo loc < 5

    @cameraTowards loc
    while poly.playerDistanceTo(loc) > 5
      @walkTowards loc
      console.log 'nope' if not poly.isPlayerFacing loc

      await setTimeout defer(), 250
    console.log 'Here!'

  walkTowards: (loc) ->
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

  cameraTo: (angle) ->
    angDiff = vector.constrainPi(angle - poly.cameraAngle())

    absDiff = Math.abs(angDiff)
    threshold = switch
      when absDiff > 0.5 then 0.4
      when 0.2 < absDiff < 0.5 then 0.2
      else 0.1

    while Math.abs(angDiff) > threshold
      direction = if angDiff > 0 then 'left' else 'right'
      driver.checkFocus()
      driver.sendKey 'down', direction
      await setTimeout defer(), 100
      driver.sendKey 'up', direction
      angDiff = vector.constrainPi(angle - poly.cameraAngle())
    console.log 'Facing direction!'

  cameraTowards: (loc) ->
    @cameraTo vector.angle vector.sub loc, poly.playerLoc()

@driver = driver
