define ->
    timer = null

    cancel: ->
      if timer
        window.clearTimeout timer
        timer = null;

    delay: (timeout, callback) ->
      @cancel()

      timer = window.setTimeout ->
        timer = null
        callback()
      , timeout
