define ["jquery", "backbone", "hbs!templates/users/actions", "text!./actions.json"], ($, Backbone, template, data) ->

    class UsersActionsView extends Backbone.View
      el: "#body header"

      initialize: ->
        @render()

      render: ->
        self = @

        @$el.html(template(JSON.parse(data)))

        $("input.search").bind("keyup", ->
          self.search $(@)
        )

        this

      search: ($input) ->
        console.log($input.val())
