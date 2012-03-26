define(["backbone", "cs!models/user"], (Backbone, User) ->
  class Users extends Backbone.Collection
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
)