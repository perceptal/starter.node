define(["jquery", "backbone", "cs!routers/home", "cs!routers/users"], ($, Backbone, HomeRouter, UsersRouter) ->

  initialize: ->
    new HomeRouter()
    new UsersRouter()

    Backbone.history.start()
)