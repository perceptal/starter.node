define ["backbone", "cs!lib/controller", "cs!views/navigation/main", "cs!routers/home", "cs!routers/users"], (Backbone, Controller, MainNavView, HomeRouter, UsersRouter) ->

  class ApplicationController extends Controller

    initialize: ->
      new MainNavView()

      new HomeRouter()
      new UsersRouter()

      Backbone.history.start()
