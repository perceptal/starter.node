define ["jquery", "cs!lib/collection_view", "hbs!templates/navigation/index"], ($, View, template) ->

  class IndexView extends View
    tagName: "ul"

    initialize: ->
      @menu = @options.menu
      @render()

    render: ->
      @$el.html(template(JSON.parse(@menu)))

      this
