class CodenameOne.Models.MapTile extends Backbone.Model

  width: 60
  height: 70

  drawField: (context) =>
    tile = new Image()
    tile.src = '/assets/tail.png'
    tile.onload = =>
       context.drawImage tile, @attributes.x, @attributes.y
