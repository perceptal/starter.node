define(["jquery", "backbone", "cs!models/user"], ($, Backbone, User, UserCollection) ->

  class EditView extends Backbone.View
    initialize: ->
      @users = @options.users
      @render()

    render: ->

  new EditView
)