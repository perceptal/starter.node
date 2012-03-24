define(["jquery", "backbone", "hbs!templates/users"], ($, Backbone, template) ->

  class IndexView extends Backbone.View
    tagName: "li"
    el: "#users"

    initialize: ->
      @render()

    render: ->
      $(@el).html(template(users: @collection.toJSON()))
)