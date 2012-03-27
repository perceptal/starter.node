define ["jquery", "cs!lib/view", "cs!views/users/user"], ($, View, UserView) ->

  class ShowView extends View
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
