define ["jquery", "cs!lib/view", "hbs!templates/users/user"], ($, View, template) ->

  class UserView extends View
    tagName: "article"
    className: "list"

    render: ->
      @$el.html(template(@model.toJSON()))

      this
