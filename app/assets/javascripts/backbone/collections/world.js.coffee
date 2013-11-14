class CodenameOne.Collections.World extends Backbone.Collection

  model: CodenameOne.Models.MapTile
  url: '/world'
  tileWidth: 60
  tileHeight: 70

  initialize: ->
    map = document.getElementById 'map'
    @context = map.getContext '2d'

  drawMap: ->
    _.each @models, (tile) =>
      tile.drawField @context
    @attachEvents()

  attachEvents: ->
    $('#map').click (e) =>
      currentTile = @findTileByCoordinates e.offsetX, e.offsetY
      if currentTile
        if currentTile.selected then currentTile.drawField @context else currentTile.markAsSelected @context

  findTileByCoordinates: (offsetX, offsetY) ->
    _.find @models, (tile) =>
      tile.isClicked(offsetX, offsetY)
