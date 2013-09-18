driver =
  clickWorld: (loc) ->
    @clickScreen poly.worldToScreen loc

  clickScreen: (pixel) ->
    @clickClient @screenToClient pixel

  clickClient: (pixel) ->
    if not poly.isFocused()
      poly.$canvas().simulate 'mousedown'
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
      @clickWorld poly.playerLoc()
      poly.$canvas().focus()


  screenToClient: (point) ->
    $canvas = poly.$canvas
    offset_t = $canvas().offset().top - $(window).scrollTop()
    offset_l = $canvas().offset().left - $(window).scrollLeft()
    [point[0] + offset_l, point[1] + offset_t]
