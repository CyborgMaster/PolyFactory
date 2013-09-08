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
  loaded = CrashMob?.globals?.gameManager?.heroEntity?.v3Location?

  return if not loaded

  $player.html vectorString CrashMob.globals.gameManager.heroEntity.v3Location
  $playerScreen.html vectorString CrashMob.globals.camera.worldToScreen(
    CrashMob.globals.gameManager.heroEntity.v3Location)

vectorString = (loc) ->
  (val.toFixed 1 for val in loc).join ', '

$(document).ready setup

# entity manager
# resource despenser managers
# game space map
