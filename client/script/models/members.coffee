define ["cs!lib/collection", "cs!./member"], (Collection, Member) ->

  class Members extends Collection

    model:    Member

    urlRoot:  "/people/"

    initialize: ->
      @url = @urlRoot