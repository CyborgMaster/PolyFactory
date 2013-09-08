poly =
  playerLoc: ->
    CrashMob.globals.gameManager.heroEntity.v3Location

  worldToScreen: (loc) ->
    CrashMob.globals.camera.worldToScreen loc
