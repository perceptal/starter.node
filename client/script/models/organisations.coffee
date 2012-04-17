define ["localstorage", "cs!lib/collection", "cs!./organisation"], (LocalStorage, Collection, Organisation) ->

  class Organisations extends Collection

    model:    Organisation

    urlRoot:  "/organisations/"

    initialize: ->
      @url = @urlRoot

    supports_local_storage: true

    localStorage: new LocalStorage("organisations")