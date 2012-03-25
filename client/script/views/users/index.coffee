define(["jquery", "backbone", "cs!views/users/user"], ($, Backbone, UserView) ->

  class IndexView extends Backbone.View
    el: "#users"

    initialize: ->
      @render()

    render: ->
      self = @

      @$el.empty()

      @collection.each((user) ->
        view = new UserView({ model: user })

        self.$el.append(view.render().$el)
      )

      self
)