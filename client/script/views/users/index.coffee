define ["jquery", "cs!lib/view", "cs!views/users/user"], ($, View, UserView) ->

  class IndexView extends View
    initialize: ->
      @render()

    render: ->
      self = @
      @reset()

      @collection.each((user) ->
        view = new UserView({ model: user })

        self.$el.append(view.render().$el)
      )

      @$el.hide()

      this

    on_show: ->
      @$el.fadeIn 500

    reset: ->
      @$el.empty()
