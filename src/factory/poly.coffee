poly =
  playerLoc: ->
    CrashMob.globals.gameManager.heroEntity.v3Location

  playerAngle: ->
    CrashMob.globals.gameManager.heroEntity.yAngle

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

  cameraAngle: ->
    vector.angle CrashMob.globals.gameManager.gameCamera.currentv3Direction

  isPlayerFacingAngle: (angle) ->
    Math.abs(vector.constrainPi(angle - @playerAngle())) < 0.2

  isPlayerFacing: (loc) ->
    @isPlayerFacingAngle vector.angle vector.sub loc, @playerLoc()

@poly = poly
