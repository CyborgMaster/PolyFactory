console.log 'PolyFactory started!'

$status = null
$loc = null

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
  $loc = $ '#poly-location'
  setInterval updateStatus, 1000

updateStatus = ->
  loc = CrashMob?.globals?.gameManager?.heroEntity?.v3Location
  if loc?
    $loc.html "#{loc[0].toFixed 1}, #{loc[1].toFixed 1}, #{loc[2].toFixed 1}"

$(document).ready setup
