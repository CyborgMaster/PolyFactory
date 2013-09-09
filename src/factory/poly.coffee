poly =
  playerLoc: ->
    CrashMob.globals.gameManager.heroEntity.v3Location

  worldToScreen: (loc) ->
    CrashMob.globals.camera.worldToScreen loc

  $canvas: ->
    $ '#turbulenz_game_engine_object'

  screenToClient: (point) ->
    offset_t = @$canvas().offset().top - $(window).scrollTop()
    offset_l = @$canvas().offset().left - $(window).scrollLeft()
    [point[0] + offset_l, point[1] + offset_t]

  worldToClient: (loc) ->
    @screenToClient @worldToScreen loc

  isFocused: ->
    CrashMob.globals.inputDevice.isFocused()
