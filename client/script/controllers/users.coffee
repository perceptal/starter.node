define ["cs!lib/controller", "cs!models/users", "cs!models/user", "cs!views/users/index", "cs!views/users/show", "cs!views/navigation/users/actions"], (Controller, Users, User, IndexView, ShowView, ActionsView) ->

  class UsersController extends Controller

    initialize: ->

    index: ->
      @log "users", "index"

      users = new Users()

      users.fetch
        success: ->
          new ActionsView()
          new IndexView(collection: users)

    show: (id) ->
      @log "users", "show", id

      user = new User({ id: id })

      user.fetch
        success: ->
          new ActionsView()
          new ShowView(model: user)

    search: (q) ->
      @log "users", "search", q

      users = new Users()
      users.url = users.search_url q

      users.fetch
        success: ->
          new ActionsView()
          new IndexView(collection: users)
