define ["cs!lib/controller"], (Controller) ->

  class HomeController extends Controller

    index: ->
      @log "home", "index"