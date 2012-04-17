define ["backbone", "cs!lib/collection", "cs!./member"], (Backbone, Collection, Member) ->

  class Members extends Collection

    model:    Member

    urlRoot:  "/people/"

    initialize: ->
      @url = @urlRoot

    