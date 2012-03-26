define(["jquery", "backbone", "cs!views/users/user", "cs!views/navigation/users/actions"], ($, Backbone, UserView, ActionsView) ->

  class IndexView extends Backbone.View
    el: "#body .content"

    initialize: ->
      @render_actions()
      @render()

    render: ->
      self = @
      @reset()

      @collection.each((user) ->
        view = new UserView({ model: user })

        self.$el.append(view.render().$el)
      )

      self

    reset: ->
      @$el.empty()

    render_actions: ->
      new ActionsView()

      self = @

      $("input.search").bind("keyup", ->
        self.search $(@)
      )

    search: ($input) ->
      @collection = @collection.search $input.val()

      @render()
)