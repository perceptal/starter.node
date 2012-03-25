define(["jquery", "backbone", "hbs!templates/users/user"], ($, Backbone, template) ->

  class UserView extends Backbone.View
    tagName: "article"
    className: "list"

    render: ->
      @$el.html(template(@model.toJSON()))

      this
)