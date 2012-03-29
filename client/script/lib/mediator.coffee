define ["backbone"], (Backbone) ->
  mediator = {}

  mediator.user = null

  _(mediator).defaults Backbone.Events

  # Create Publish/Subscribe aliases
  mediator.subscribe   = mediator.on      = Backbone.Events.on
  mediator.unsubscribe = mediator.off     = Backbone.Events.off
  mediator.publish     = mediator.trigger = Backbone.Events.trigger

  mediator