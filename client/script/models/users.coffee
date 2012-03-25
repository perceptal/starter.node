define(["backbone", "cs!models/user"], (Backbone, User) ->
  class Users extends Backbone.Collection
    model:  User
    url:    "/users/"

    search_url: (q) ->
      @url + "search/" + q

    search: (q) ->
      @query = q

      @url = @search_url q

      @fetch()

      this
)