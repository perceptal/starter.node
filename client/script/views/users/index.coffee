define ["jquery", "cs!lib/view", "cs!views/users/user"], ($, View, UserView) ->

  class IndexView extends View
    el: "#body .content"

    initialize: ->
      @render()

    render: ->
      self = @
      @reset()

      @collection.each((user) ->
        view = new UserView({ model: user })

        self.$el.append(view.render().$el)
      )

      this

    reset: ->
      @$el.empty()
