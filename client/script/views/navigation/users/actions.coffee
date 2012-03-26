define(["jquery", "backbone", "hbs!templates/users/actions", "text!./actions.json"], ($, Backbone, template, data) ->

    class UsersActionsView extends Backbone.View
      el: "#body header"

      initialize: ->
        @render()

      render: ->
        @$el.html(template(JSON.parse(data)))

        this
)