class CodenameOne.Models.MapTile extends Backbone.Model

  width: 60
  height: 70
  selected: false

  drawField: (context) ->
    tile = new Image()
    tile.src = '/assets/tail.png'
    tile.onload = =>
      context.drawImage tile, @scaledX(), @scaledY()
      @selected = false

  markAsSelected: (context) ->
    tile = new Image()
    tile.src = '/assets/tail_selected.png'
    tile.onload = =>
      context.drawImage tile, @scaledX(), @scaledY()
      @selected = true

  scaledX: ->
    widthWithoutOffset = @attributes.x * @width
    if not(@attributes.y % 2) then widthWithoutOffset else widthWithoutOffset + @width / 2

  scaledY: ->
    @attributes.y * Math.floor @height * 3 / 4

  isClicked: (offsetX, offsetY) ->
    MathHelper.pointIsInRectangle({ x: offsetX, y: offsetY },  { x: @scaledX(), y: @scaledY() }, @width, @height) and
    not MathHelper.pointIsInTriangle({ x: offsetX, y: offsetY }, { x: @scaledX(), y: @scaledY() },
      { x: @scaledX() + @width / 2, y: @scaledY() },
      { x: @scaledX(), y: @scaledY() + @height / 4 }) and
    not MathHelper.pointIsInTriangle({ x: offsetX, y: offsetY }, { x: @scaledX() + @width, y: @scaledY() },
      { x: @scaledX() + @width / 2, y: @scaledY() },
      { x: @scaledX() + @width, y: @scaledY() + @height / 4 }) and
    not MathHelper.pointIsInTriangle({ x: offsetX, y: offsetY }, { x: @scaledX(), y: @scaledY() + @height },
      { x: @scaledX(), y: @scaledY() + (@height * 3) / 4 },
      { x: @scaledX() + @width / 2, y: @scaledY() + @height }) and
    not MathHelper.pointIsInTriangle({ x: offsetX, y: offsetY }, { x: @scaledX() + @width, y: @scaledY() + @height },
      { x: @scaledX() + @width, y: @scaledY() + (@height * 3) / 4 },
      { x: @scaledX() + @width / 2, y: @scaledY() + @height })
