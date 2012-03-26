define(["jquery", "backbone", "cs!views/navigation/main", "cs!routers/home", "cs!routers/users"], ($, Backbone, MainNavView, HomeRouter, UsersRouter) ->

  initialize: ->
    new MainNavView()

    new HomeRouter()
    new UsersRouter()

    Backbone.history.start()
)