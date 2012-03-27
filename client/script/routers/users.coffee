define ["cs!lib/router", "cs!controllers/users"], (Router, UsersController) ->

  class UsersRouter extends Router
    routes:
      "users/":               "index",
      "users/search/:q":      "search"
      "users/:id":            "show",

    initialize: ->
      @controller = new UsersController()

    index: ->
      @controller.index()

    show: (id) ->
      @controller.show(id)

    search: (q) ->
      @controller.search(q)