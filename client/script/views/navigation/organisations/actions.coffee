define ["jquery", "cs!lib/mediator", "cs!../actions", "hbs!templates/navigation/actions", "text!./actions.json"], ($, mediator, View, template, data) ->

  class ActionsView extends View

    initialize: ->
      @init({ search_for: "organisations", query: @options.query })
