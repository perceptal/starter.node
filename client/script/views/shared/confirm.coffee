define ["jquery", "cs!lib/mediator", "cs!lib/util", "cs!lib/view", "hbs!templates/shared/confirm"], ($, mediator, util, View, template) ->

  class ConfirmView extends View
    tagName: "span"

    events:
      "click a.yes":  "confirm"
      "click a.no":   "close"

    callback: null
    context:  null
    question: "Are you sure?"
    y:        "yes"
    n:        "no"

    initialize: ->
      @callback = @options.callback
      @context = @options.context
      @question = @options.question if @options.question
      @y = @options.yes if @options.yes
      @n = @options.no if @options.no

      @render()

    render: ->
      @$el.html(template({ question: @question, yes: @y, no: @n }))

      this

    on_show: ->
      util.centre(@$el.parent())
      @$el.parent().fadeIn 500

    confirm: ->
      @callback.apply @context, @callback.arguments
      @close()

      mediator.publish "confirmed"

    close: ->
      @$el.parent().hide()
      @remove()
      @unbind()

      mediator.publish "confirm:closed"
