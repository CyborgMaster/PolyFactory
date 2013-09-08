console.log 'PolyFactory started!'

$status = null
$player = null
$playerScreen = null

setup = ->
  $('body').append '<div id="poly-factory" style="
  width: 200px;
  height: 200px;
  position: fixed;
  top: 0;
  left: 0;
  background: white;
  z-index: 1000000;
  "></div>'

  $status = $ '#poly-factory'
  $status.append '<div>Player: <span id="poly-location"><span></div>'
  $player = $ '#poly-location'
  $status.append '<div>PlayerScreen: <span id="poly-player-screen"><span></div>'
  $playerScreen = $ '#poly-player-screen'

  setInterval updateStatus, 1000

updateStatus = ->
  $player.html vectorString playerLoc()
  $playerScreen.html vectorString worldToScreen playerLoc()

vectorString = (loc) ->
  (val.toFixed 1 for val in loc).join ', '

waitForLoad = ->
  #Wait until the game engine has loaded enough to have a hero loaction
  while not CrashMob?.globals?.gameManager?.heroEntity?.v3Location?
    await setTimeout defer(), 1000
  setup()

playerLoc = ->
  CrashMob.globals.gameManager.heroEntity.v3Location

worldToScreen = (loc) ->
  CrashMob.globals.camera.worldToScreen loc


walkNorth = ->

@polyFactory = {}
@polyFactory.go = walkNorth

$(document).ready waitForLoad

# entity manager
# resource despenser managers
# game space map
