define(["backbone"], (Backbone) ->
  class User extends Backbone.Model
    url: "/users/:id"
)