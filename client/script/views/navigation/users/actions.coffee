define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/users/actions", "text!./actions.json"], ($, mediator, View, template, data) ->

    class UsersActionsView extends View
      query: ""

      initialize: ->
        mediator.subscribe "users:searched", @focus

        @query = @options.query if @options.query

        @render()

      render: ->
        @$el.html(template({ q: @query, actions: JSON.parse(data) }))

        @

      on_show: ->
        self = @

        $(".users input.search").bind "keyup", -> self.search $(@)

      search: ($input) ->
        q = $input.val()

        mediator.publish "users:search", q

      focus: ->
        $search = $(".users input.search")
        $search.focus()
        $search.val($search.val())

