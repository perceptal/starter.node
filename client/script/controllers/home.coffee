define ["cs!lib/controller"], (Controller) ->

  class HomeController extends Controller

    index: ->
      console.log "home#index"