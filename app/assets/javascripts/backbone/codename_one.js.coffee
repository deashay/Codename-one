#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./helpers

window.CodenameOne =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$(document).ready ->
  if ($map = $('#map')).length
    world = new CodenameOne.Views.World
    world.render()
