define(["jquery", "backbone", "cs!routers/users"], ($, Backbone, UsersRouter) ->

  initialize: ->
    new UsersRouter()

    Backbone.history.start()
)