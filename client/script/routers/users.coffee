define(["backbone", "cs!models/users", "cs!models/user", "cs!views/users/index", "cs!views/users/show"], (Backbone, Users, User, IndexView, ShowView) ->

  class UsersRouter extends Backbone.Router
    routes:
      "users/":               "index",
      "users/:id":            "show",
      "users/search?q=:q":    "search"

    index: ->
      users = new Users()

      users.fetch
        success: ->
          new IndexView(collection: users)

        error: ->
          alert "Error"

    show: (id) ->
      user = new User({ id: id })

      user.fetch
        success: ->
          new ShowView(model: user)

    search: (q) ->
)