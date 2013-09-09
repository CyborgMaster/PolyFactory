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

    @status = $ '#poly-factory'

    $('body').append '<div id="poly-marker" style="
      width: 10px;
      height: 10px;
      position: fixed;
      top: 0;
      left: 0;
      background: blue;
      z-index: 1000001;
      "></div>'
    @marker = $ '#poly-marker'

    setInterval @update.bind(this), 100

  update: ->
    loc = poly.playerLoc()
    north = loc[..]
    north[0] += 5
    northScreen = poly.worldToScreen north
    northClient = driver.screenToClient northScreen

    @marker.css { left: northClient[0], top: northClient[1] }

    @status.html "Player: #{@vectorString poly.playerLoc()}<br>
      Player Screen: #{@vectorString poly.worldToScreen poly.playerLoc()}<br>
      North: #{@vectorString north}<br>
      North Screen: #{@vectorString northScreen}<br>
      North Client: #{@vectorString northClient}<br>
      Focus: #{poly.isFocused()}<br>
      "


  vectorString: (loc) ->
    (val.toFixed 1 for val in loc).join ', '
