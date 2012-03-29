define ["underscore", "backbone", "cs!./subscriber"], (_, Backbone, Subscriber) ->

  class CollectionView extends Backbone.View

    _(CollectionView.prototype).defaults Subscriber

    log: ->
      console.log arguments

    disposed: false

    dispose: ->
      return if @disposed

      @remove()
      @unbind()

      @unsubscribe_all_events()

      @disposed = true