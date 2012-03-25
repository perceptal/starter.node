define(["jquery", "backbone", "cs!views/users/user"], ($, Backbone, UserView) ->

  class ShowView extends Backbone.View
    el: "#users"

    initialize: ->
      @render()

    render: ->
      view = new UserView({ model: @model, className: "item" })

      @$el.html(view.render().$el)

      this
)