define(["jquery", "backbone", "hbs!templates/navigation/index", "text!views/navigation/main.json"], ($, Backbone, template, data) ->

  class IndexView extends Backbone.View
    el: "nav#main"

    initialize: ->
      @render()

    render: ->
      console.log data
      @$el.html(template(JSON.parse(data)))

      this
)