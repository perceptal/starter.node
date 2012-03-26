define(["backbone", "cs!views/navigation/main"], (Backbone, MainNavView) ->

  class HomeRouter extends Backbone.Router
    routes:
      "":                     "index"

    index: ->

)