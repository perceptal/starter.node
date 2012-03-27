define ["cs!lib/router", "cs!controllers/home"], (Router, HomeController) ->

  class HomeRouter extends Router
    routes:
      "":                     "index"

    initialize: ->
      @controller = new HomeController()

    index: ->
      @controller.index()
