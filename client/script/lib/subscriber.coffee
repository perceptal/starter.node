define ["cs!./mediator"], (mediator) ->

  Subscriber =
    # The subscriptions storage
    global_subscriptions: null

    subscribe_event: (type, handler, context) ->
      @global_subscriptions or= {}

      # Add to store
      handlers = @global_subscriptions[type] or= []
      return if _(handlers).include handler
      handlers.push handler

      # Register global handler
      mediator.subscribe type, handler, context or= @

    unsubscribe_event: (type, handler) ->
      return unless @global_subscriptions

      # Remove from store
      handlers = @global_subscriptions[type]

      if handlers
        index = _(handlers).indexOf handler
        handlers.splice index, 1 if index > -1
        delete @global_subscriptions[type] if handlers.length is 0

      # Remove global handler
      mediator.unsubscribe type, handler

    # Unbind all recorded global handlers
    unsubscribe_all_events: () ->
      return unless @global_subscriptions

      for own type, handlers of @global_subscriptions
        for handler in handlers
          # Remove global handler
          mediator.unsubscribe type, handler

      # Clear store
      @global_subscriptions = null
