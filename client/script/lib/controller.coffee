define ["underscore", "cs!./mediator", "cs!./subscriber"], (_, mediator, Subscriber) ->

  class Controller

    _(Controller.prototype).defaults Subscriber

    name: null
    router: null

    constructor: ->
      @initialize()

    initialize: ->

    log: ->
      console.log arguments

    error: (message) ->
      mediator.publish "error", message

    info: (message) ->
      mediator.publish "info", message

    warning: (message) ->
      mediator.publish "warning", message

    loading: (message) ->
      mediator.publish "loading", message or= "Loading..."

    confirm: (callback, context, question, y, n) ->
      mediator.publish "confirm", callback, context, question or= "Are you sure?", y or= "yes", n or= "no"

    disposed: false

    dispose: ->
      return if @disposed

      @unsubscribe_all_events()

      @disposed = true