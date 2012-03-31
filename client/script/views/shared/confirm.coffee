define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/shared/confirm"], ($, mediator, View, template) ->

  class ConfirmView extends View
    tagName: "span"

    events:
      "click a.yes":  "confirm"
      "click a.no":   "close"

    callback: null
    message:  "Are you sure?"
    y:        "yes"
    n:        "no"

    initialize: ->
      @callback = @options.callback
      @message = @options.message if @options.message
      @y = @options.yes if @options.yes
      @n = @options.no if @options.no

    render: ->
      @$el.html(template({ message: @message, yes: @y, no: @n }))

      this

    on_show: ->
      @centre()
      @$el.parent().fadeIn 500

    confirm: ->
      callback()

      mediator.publish "confirmed"

    close: ->
      @$el.parent().hide()
      @remove()
      @unbind()

      mediator.publish "confirm:closed"

    centre: ->
      $el = @$el.parent()
      $el.css
        top: ($(window).scrollTop() + 175) + "px"
        left: "50%"
        margin: "-" + ($el.height() / 2) + "px 0 0 -" + ($el.width() / 2) + "px"

