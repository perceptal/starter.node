define [
    "jquery"
  , "cs!lib/mediator"
  , "cs!lib/timer"
  , "cs!lib/util"
  , "cs!lib/view"
  , "hbs!templates/shared/dialog"
], ($, mediator, timer, util, View, template) ->

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

      timer.delay 10000, @close, @ unless @type == "loading"

    close: ->
      @$el.parent().fadeOut 250, ->
        @remove()
        @unbind()

      mediator.publish "dialog:closed"
