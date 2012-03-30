define ["cs!lib/collection", "cs!./organisation"], (Collection, Organisation) ->

  class Organisations extends Collection

    model:    Organisation

    urlRoot:  "/organisations/"
    url:      "/organisations/"

    search_url: (q) ->
      @url + "search/" + q

    search: (q, render) ->
      @query = q

      @url = @search_url q

      @fetch()

      @url = @urlRoot

      this
