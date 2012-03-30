define ["cs!lib/collection", "cs!./member"], (Collection, Member) ->

  class Users extends Collection

    model:    Member

    urlRoot:  "/people/"
    url:      "/people/"

    search_url: (q) ->
      @url + "search/" + q

    search: (q, render) ->
      @query = q

      @url = @search_url q

      @fetch()

      @url = @urlRoot

      this
