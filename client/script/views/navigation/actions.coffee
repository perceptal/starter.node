define ["require", "jquery", "cs!lib/mediator", "cs!lib/collection_view", "hbs!templates/navigation/actions"], (require, $, mediator, View, template) ->

  class ActionsView extends View
    tagName: "nav"
    className: "secondary "

    query: ""

    search_input: -> $("." + @search_for + " input.search")

    init: (options) ->
      if options
        @search_for = options.search_for if options.search_for
        @query = options.query if options.query
        @data = require "text!./" + @search_for + "/actions.json"
        @className += @search_for

        mediator.subscribe @search_for + ":searched", @focus, @

      @render()

    render: ->
      @$el.html(template({ search_for: @search_for, q: @query, actions: JSON.parse(@data) }))

      @

    on_show: ->
      self = @

      @search_input().bind "keyup", -> self.search $(@)

    search: ($input) ->
      q = $input.val()

      mediator.publish @search_for + ":search", q

    focus: ->
      console.log @

      $search = @search_input()
      $search.focus()
      $search.val($search.val())

