define ["cs!lib/mediator", "cs!lib/region", "cs!lib/controller", "cs!models/users", "cs!models/user", "cs!views/users/index", "cs!views/users/show", "cs!views/navigation/users/actions"], (mediator, Region, Controller, Users, User, IndexView, ShowView, ActionsView) ->

  class UsersController extends Controller

    initialize: ->
      mediator.subscribe "users:search", @search

      @main_region = new Region({ el: "#body .content" })
      @actions_region = new Region({ el: "#body header" })

    index: ->
      @log "users", "index"

      users = new Users()

      ar = @actions_region
      mr = @main_region

      users.fetch
        success: ->
          ar.show new ActionsView()
          mr.show new IndexView(collection: users)

    show: (id) ->
      @log "users", "show", id

      user = new User({ id: id })

      ar = @actions_region
      mr = @main_region

      user.fetch
        success: ->
          ar.show new ActionsView()
          mr.show new ShowView(model: user)

    search: (q) ->
      return if q.length == 0

      users = new Users()
      users.url = users.search_url q

      ar = @actions_region
      mr = @main_region

      users.fetch
        success: ->
          ar.show new ActionsView(query: q)
          mr.show new IndexView(collection: users)

          mediator.publish "users:searched"
