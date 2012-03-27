define ["backbone", "cs!controllers/users"], (Backbone, UsersController) ->

  class UsersRouter extends Backbone.Router
    routes:
      "users/":               "index",
      "users/search/:q":      "search"
      "users/:id":            "show",

    controller: null

    initialize: ->
      @controller = new UsersController()

    index: ->
      @controller.index()

    show: (id) ->
      @controller.show(id)

    search: (q) ->
      @controller.search(q)