define ["cs!lib/collection", "cs!./organisation"], (Collection, Organisation) ->

  class Organisations extends Collection

    model:    Organisation

    urlRoot:  "/organisations/"

    initialize: ->
      @url = @urlRoot