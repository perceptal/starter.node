define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/members/actions", "text!./actions.json"], ($, mediator, View, template, data) ->

    class ActionsView extends View
      tagName: "nav"
      className: "secondary members"

      query: ""

      initialize: ->
        mediator.subscribe "members:searched", @focus

        @query = @options.query if @options.query

        @render()

      render: ->
        @$el.html(template({ q: @query, actions: JSON.parse(data) }))

        @

      on_show: ->
        self = @

        $(".members input.search").bind "keyup", -> self.search $(@)

      search: ($input) ->
        q = $input.val()

        mediator.publish "members:search", q

      focus: ->
        $search = $(".members input.search")
        $search.focus()
        $search.val($search.val())

