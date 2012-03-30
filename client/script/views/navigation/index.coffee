define ["jquery", "cs!lib/collection_view", "hbs!templates/navigation/index", "text!./main.json"], ($, View, template, data) ->

  class IndexView extends View
    tagName: "ul"

    initialize: ->
      @render()

    render: ->
      @$el.html(template(JSON.parse(data)))

      this