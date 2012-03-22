define(["jquery", "backbone", "text!templates/users.hbs"], ($, Backbone, template) ->

  class IndexView extends Backbone.View
    tagName: "li"
    el: "#users"

    initialize: ->
      @render()

    template: Handlebars.compile(template)

    render: ->
      $(@el).html(@template(users: @collection.toJSON()))
)