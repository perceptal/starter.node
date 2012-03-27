define ["jquery", "cs!lib/view", "hbs!templates/navigation/index", "text!./main.json"], ($, View, template, data) ->

  class IndexView extends View
    el: "nav#main"

    initialize: ->
      @render()

    render: ->
      @$el.html(template(JSON.parse(data)))

      this
