define ->
    timer = null

    cancel: ->
      if timer
        window.clearTimeout timer
        timer = null;

    delay: (timeout, callback, context) ->
      @cancel()

      timer = window.setTimeout ->
        timer = null

        callback.apply context, callback.arguments
      , timeout
