define ["jquery", "cs!lib/view", "hbs!templates/navigation/index"], ($, View, template) ->

  class IndexView extends View
    tagName: "ul"

    events:
      "click a": "select"

    initialize: ->
      @menu = @options.menu

      @render()

    render: ->
      @$el.html(template(JSON.parse(@menu)))

      this

    select: (e) ->
      $link = $ e.currentTarget

      @$el.find("a").removeClass "active"

      $link.addClass "active"