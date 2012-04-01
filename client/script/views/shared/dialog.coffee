define ["jquery", "cs!lib/mediator", "cs!lib/util", "cs!lib/view", "hbs!templates/shared/dialog"], ($, mediator, util, View, template) ->

  class DialogView extends View
    tagName: "span"

    events:
      "click a.close": "close"

    message: ""
    type:    ""

    initialize: ->
      @message = @options.message
      @type = @options.type

      @render()

    render: ->
      @$el.html(template({ message: @message, type: @type }))

      this

    on_show: ->
      util.centre(@$el.parent())
      @$el.parent().fadeIn 500

    close: ->
      @$el.parent().hide()
      @remove()
      @unbind()

      mediator.publish "dialog:closed"
