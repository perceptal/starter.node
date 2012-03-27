define ["underscore", "backbone", "cs!./subscriber"], (_, Backbone, Subscriber) ->

  class Model extends Backbone.Model

    _(Model.prototype).defaults Subscriber

    log: ->
      console.log arguments

    disposed: false

    dispose: ->
      return if @disposed

      @unsubscribe_all_events()

      @disposed = true