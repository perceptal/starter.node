define ["backbone", "cs!controllers/users", "cs!models/users", "cs!models/user", "cs!views/users/index", "cs!views/users/show", "cs!views/navigation/users/actions"], (Backbone, UsersController, Users, User, IndexView, ShowView, ActionsView) ->

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