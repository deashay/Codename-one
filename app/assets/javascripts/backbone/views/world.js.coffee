class CodenameOne.Views.World extends Backbone.View

  render: ->
    world = new CodenameOne.Collections.World
    world.fetch success: ->
      world.drawMap()

