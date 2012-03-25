define(["jquery", "backbone", "cs!views/users/user", "hbs!templates/users/actions"], ($, Backbone, UserView, actions) ->

  class ShowView extends Backbone.View
    el: "#body"

    initialize: ->
      @render()

    render: ->
      @reset()
      @render_actions()

      view = new UserView({ model: @model, className: "item" })

      @$el.append(view.render().$el)

      this

    render_actions: ->
      @$el.append(actions({ query: "" }))

    reset: ->
      @$el.empty()
)