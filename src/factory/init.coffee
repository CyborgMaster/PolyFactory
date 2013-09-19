waitForLoad = ->
  #Wait until the game engine has loaded enough to have a hero loaction
  while typeof CrashMob?.globals?.gameManager?.heroEntity?.yAngle != 'number'
    await setTimeout defer(), 1000
  console.log 'PolyFactory started!'
  status.setup()

$(document).ready waitForLoad
