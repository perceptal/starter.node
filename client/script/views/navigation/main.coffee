define(["jquery", "backbone", "hbs!templates/navigation/index"], ($, Backbone, template) ->

  class IndexView extends Backbone.View
    el: "nav#main"

    initialize: ->
      @render()

    render: ->
      @$el.html(template({}))

      this

)