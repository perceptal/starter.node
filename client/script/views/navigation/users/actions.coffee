define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/users/actions", "text!./actions.json"], ($, mediator, View, template, data) ->

    class UsersActionsView extends View
      el: "#body header"

      query: ""

      initialize: ->
        mediator.subscribe "users:searched", @focus

        @query = @options.query if @options.query

        @render()

      render: ->
        self = @

        @$el.html(template({ q: @query, actions: JSON.parse(data) }))

        $(".users input.search").bind("keyup", ->
          self.search $(@)
        )

        this

      search: ($input) ->
        q = $input.val()

        mediator.publish "users:search", q

      focus: ->
        $(".users input.search").focus()

