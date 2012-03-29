define ["cs!lib/router", "cs!controllers/home"], (Router, HomeController) ->

  class HomeRouter extends Router
    routes:
      "":                     "index"

    controller: new HomeController()
