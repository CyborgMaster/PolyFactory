waitForLoad = ->
  #Wait until the game engine has loaded enough to have a hero loaction
  while not CrashMob?.globals?.gameManager?.heroEntity?.v3Location?
    await setTimeout defer(), 1000
  console.log 'PolyFactory started!'
  status.setup()

$(document).ready waitForLoad
