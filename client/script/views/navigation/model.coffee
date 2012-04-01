define [
    "jquery"
  , "cs!lib/mediator"
  , "cs!lib/timer"
  , "cs!lib/view"
  , "hbs!templates/navigation/model"
], ($, mediator, timer, View, template) ->

  class ModelView extends View
    tagName: "nav"
    className: "model "

    query: ""

    events:
      "click a": "select"

    initialize: ->
      @menu = @options.menu if @options.menu

      @render()

    render: ->
      @$el.html(template({ menu: JSON.parse(@menu) }))

      @

    on_show: ->
      self = @

    select: (e) ->
      $link = $ e.currentTarget

      @$el.find("a").removeClass "active"

      $link.addClass "active"