define ["cs!lib/router", "cs!controllers/home"], (Router, Controller) ->

  class HomeRouter extends Router
    routes:
      "" : "index"

    controller: new Controller()
