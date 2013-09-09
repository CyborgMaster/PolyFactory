console.log 'PolyFactory started!'

waitForLoad = ->
  #Wait until the game engine has loaded enough to have a hero loaction
  while not CrashMob?.globals?.gameManager?.heroEntity?.v3Location?
    await setTimeout defer(), 1000
  status.setup()

$(document).ready waitForLoad
