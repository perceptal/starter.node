define(["jquery", "backbone", "hbs!templates/navigation/index", "text!./main.json"], ($, Backbone, template, data) ->

  class IndexView extends Backbone.View
    el: "nav#main"

    initialize: ->
      @render()

    render: ->
      @$el.html(template(JSON.parse(data)))

      this
)