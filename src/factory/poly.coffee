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
