define ["underscore", "backbone", "cs!./subscriber"], (_, Backbone, Subscriber) ->

  class Router extends Backbone.Router

    _(Router.prototype).defaults Subscriber

    controller: null

    log: ->
      console.log arguments

    disposed: false

    dispose: ->
      return if @disposed

      @controller.dispose()

      @unsubscribe_all_events()

      @disposed = true