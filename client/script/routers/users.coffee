define(["backbone", "cs!models/users", "cs!models/user", "cs!views/users/index"], (Backbone, Users, User, IndexView) ->

  class UsersRouter extends Backbone.Router
    routes:
      "":                     "index",
      "users/:id":            "edit",
      "users/search?q=:q":    "search"

    index: ->
      users = new Users()

      users.fetch
        success: ->
          new IndexView(collection: users)

        error: ->
          alert "Error"

    edit: (id) ->

    search: (q) ->
)