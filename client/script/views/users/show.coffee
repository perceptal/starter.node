define ["jquery", "backbone", "cs!views/users/user"], ($, Backbone, UserView) ->

  class ShowView extends Backbone.View
    el: "#body .content"

    initialize: ->
      @render()

    render: ->
      @reset()

      view = new UserView({ model: @model, className: "item" })

      @$el.append(view.render().$el)

      this

    reset: ->
      @$el.empty()
