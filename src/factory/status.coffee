status =
  setup: ->
    $('body').append '<div id="poly-factory" style="
    width: 200px;
    height: 200px;
    position: fixed;
    top: 0;
    left: 0;
    background: white;
    z-index: 1000000;
    "></div>'

    @$status = $ '#poly-factory'
    @$status.append '<div>Player: <span id="poly-location"><span></div>'
    @$player = $ '#poly-location'
    @$status.append '<div>PlayerScreen: <span id="poly-player-screen"><span></div>'
    @$playerScreen = $ '#poly-player-screen'

    setInterval @update.bind(this), 1000

  update: ->
    @$player.html @vectorString poly.playerLoc()
    @$playerScreen.html @vectorString poly.worldToScreen poly.playerLoc()

  vectorString: (loc) ->
    (val.toFixed 1 for val in loc).join ', '
