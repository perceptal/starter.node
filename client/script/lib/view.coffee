define ["underscore", "backbone", "cs!./subscriber"], (_, Backbone, Subscriber) ->

  class View extends Backbone.View

    _(View.prototype).defaults Subscriber

    log: ->
      console.log arguments

    disposed: false

    dispose: ->
      return if @disposed

      @unsubscribe_all_events()

      @disposed = true