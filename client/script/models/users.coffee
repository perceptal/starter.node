define ["cs!lib/collection", "cs!models/user"], (Collection, User) ->

  class Users extends Collection

    model:  User
    urlRoot: "/users/"
    url:    "/users/"

    search_url: (q) ->
      @url + "search/" + q

    search: (q, render) ->
      @query = q

      @url = @search_url q

      @fetch()

      @url = @urlRoot

      this
