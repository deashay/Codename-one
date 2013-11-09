class CodenameOne.Collections.World extends Backbone.Collection
  model: CodenameOne.Models.MapTile
  url: '/world'

  drawMap: ->
    map = document.getElementById 'map'
    context = map.getContext('2d')
    _.each @models, (tile) =>
      tile.drawField context
