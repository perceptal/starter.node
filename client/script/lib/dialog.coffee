define [
    "cs!./mediator"
  , "cs!./region"
  , "cs!views/shared/dialog"
  , "cs!views/shared/confirm"
], (mediator, Region, DialogView, ConfirmView) ->

  class Dialog

    region: null

    constructor: (options) ->
      @region = new Region(el: "#confirm")

      mediator.subscribe "error",   @error, @
      mediator.subscribe "info",    @info, @
      mediator.subscribe "warning", @warning, @
      mediator.subscribe "loading", @loading, @
      mediator.subscribe "confirm", @confirm, @

    error: (message) ->
      @dialog message, "error"

    info: (message) ->
      @dialog message, "info"

    warning: (message) ->
      @dialog message, "warning"

    loading: (message) ->
      @dialog message, "loading"

    dialog: (message, type) ->
      @region.show new DialogView({ message: message, type: type })

    confirm: (callback, context, question, y, n) ->
      @region.show new ConfirmView({ question: question, context: context, yes: y, no: n, callback: callback })