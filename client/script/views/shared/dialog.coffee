define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/shared/dialog"], ($, mediator, View, template) ->

  class DialogView extends View
    tagName: "span"

    events:
      "click a.close": "close"

    message: ""
    type:    ""

    initialize: ->
      @message = @options.message
      @type = @options.type

    render: ->
      @$el.html(template({ message: @message, type: @type }))

      this

    on_show: ->
      @centre()
      @$el.parent().fadeIn 500

    close: ->
      @$el.parent().hide()
      @remove()
      @unbind()

      mediator.publish "dialog:closed"

    centre: ->
      $el = @$el.parent()
      $el.css
        top: ($(window).scrollTop() + 175) + "px"
        left: "50%"
        margin: "-" + ($el.height() / 2) + "px 0 0 -" + ($el.width() / 2) + "px"

