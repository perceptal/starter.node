define ["cs!lib/router", "cs!controllers/users"], (Router, UsersController) ->

  class UsersRouter extends Router
    app_routes:
      "users/":               "index",
      "users/search/:q":      "search"
      "users/:id":            "show",

    controller: new UsersController()
