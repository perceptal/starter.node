define(["jquery", "backbone", "cs!views/users/user", "hbs!templates/users/actions"], ($, Backbone, UserView, actions) ->

  class IndexView extends Backbone.View
    el: "#body"

    initialize: ->
      @render()

    events: {
      "change input.search": "search"
    }

    render: ->
      self = @reset()
      @render_actions()

      @collection.each((user) ->
        view = new UserView({ model: user })

        self.$el.append(view.render().$el)
      )

      self

    render_actions: ->
      @$el.append(actions({ query: @collection.query }))

    reset: ->
      @$el.empty()

      this

    search: ->
      $search = @$el.find("input.search")

      @collection = @collection.search $search.val()

      @render()

      $search.focus()
)