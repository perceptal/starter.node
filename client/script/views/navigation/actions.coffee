define ["jquery", "cs!lib/mediator", "cs!lib/collection_view", "hbs!templates/navigation/actions"], ($, mediator, View, template) ->

  class ActionsView extends View
    tagName: "nav"
    className: "secondary "

    query: ""

    search_input: -> $("." + @search_for + " input.search")

    initialize: ->
      @search_for = @options.search_for if @options.search_for
      @query = @options.query if @options.query
      @actions = @options.actions if @options.actions
      @className += @search_for

      mediator.subscribe @search_for + ":searched", @focus, @

      @render()

    render: ->
      @$el.html(template({ search_for: @search_for, q: @query, actions: JSON.parse(@actions) }))

      @

    on_show: ->
      self = @

      @search_input().bind "keyup", -> self.search $(@)

    search: ($input) ->
      q = $input.val()

      mediator.publish @search_for + ":search", q

    focus: ->
      $search = @search_input()
      $search.focus()
      $search.val($search.val())
