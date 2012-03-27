define ["jquery", "backbone", "cs!views/users/user"], ($, Backbone, UserView) ->

  class IndexView extends Backbone.View
    el: "#body .content"

    initialize: ->
      @render()

    render: ->
      self = @
      @reset()

      @collection.each((user) ->
        console.log user.email

        view = new UserView({ model: user })

        self.$el.append(view.render().$el)
      )

      this

    reset: ->
      @$el.empty()
