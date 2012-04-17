define ["backbone", "cs!lib/collection", "cs!./member"], (Backbone, Collection, Member) ->

  class Photos extends Collection

    model:    Photos

    urlRoot:  "/people/" + @get("member_id") + "/photos"

    initialize: ->
      @url = @urlRoot

    