define ["backbone"], (Backbone) ->
  mediator = {}

  mediator.user = null

  mediator.router = null

  _(mediator).defaults Backbone.Events

  # Initialize an empty callback list (so we might seal the object)
  mediator._callbacks  = null

  # Create Publish/Subscribe aliases
  mediator.subscribe   = mediator.on      = Backbone.Events.on
  mediator.unsubscribe = mediator.off     = Backbone.Events.off
  mediator.publish     = mediator.trigger = Backbone.Events.trigger

  mediator