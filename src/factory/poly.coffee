poly =
  playerLoc: ->
    CrashMob.globals.gameManager.heroEntity.v3Location

  worldToScreen: (loc) ->
    CrashMob.globals.camera.worldToScreen loc

  $canvas: ->
    $ '#turbulenz_game_engine_object'

  isFocused: ->
    CrashMob.globals.inputDevice.isFocused()

  screenSize: ->
    canvas = CrashMob.globals.canvas
    [canvas.clientWidth, canvas.clientHeight]

  pixelOnScreen: (pixel) ->
    return false if not pixel?
    size = poly.screenSize()
    400 < pixel[0] < (size[0] - 300) and 0 < pixel[1] < size[1]

  locOnScreen: (loc) ->
    @pixelOnScreen @worldToScreen loc

  playerDistanceTo: (loc) ->
    vector.len vector.sub @playerLoc(), loc
