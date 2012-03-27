define ["backbone", "cs!controllers/home"], (Backbone, HomeController) ->

  class HomeRouter extends Backbone.Router
    routes:
      "":                     "index"

    controller: null

    initialize: ->
      @controller = new HomeController()

    index: ->
      @controller.index()
