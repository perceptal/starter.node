define ["underscore", "cs!./subscriber"], (_, Subscriber) ->

  class Controller

    _(Controller.prototype).defaults Subscriber

    constructor: ->
      @initialize()

    initialize: ->

    log: ->
      console.log arguments

    disposed: false

    dispose: ->
      return if @disposed

      @unsubscribe_all_events()

      @disposed = true