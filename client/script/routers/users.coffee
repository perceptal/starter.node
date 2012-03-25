define(["backbone", "cs!models/users", "cs!models/user", "cs!views/users/index", "cs!views/users/show"], (Backbone, Users, User, IndexView, ShowView) ->

  class UsersRouter extends Backbone.Router
    routes:
      "users/":               "index",
      "users/search/:q":      "search"
      "users/:id":            "show",

    index: ->
      users = new Users()

      users.fetch
        success: ->
          new IndexView(collection: users)

    show: (id) ->
      user = new User({ id: id })

      user.fetch
        success: ->
          new ShowView(model: user)

    search: (q) ->
      users = new Users()
      users.url = users.search_url q

      users.fetch
        success: ->
          new IndexView(collection: users)
)