define ["cs!lib/router", "cs!controllers/members"], (Router, Controller) ->

  class MembersRouter extends Router
    app_routes:
      "members/":           "index",
      "members/search/:q":  "search"
      "members/:id":        "show",

    controller: new Controller()
