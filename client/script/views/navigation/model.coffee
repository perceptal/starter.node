define [
    "jquery"
  , "Handlebars"
  , "cs!lib/mediator"
  , "cs!lib/util"
  , "cs!lib/timer"
  , "cs!lib/view"
  , "hbs!templates/navigation/model"
], ($, Handlebars, mediator, util, timer, View, template) ->

  class ModelView extends View
    tagName: "nav"
    className: "model "

    events:
      "click a": "select"

    initialize: ->
      @menu = @options.menu if @options.menu

      @menu = util.inject @menu, "menu", "id", @model.id

      @render()

    render: ->
      @$el.html(template({ id: @model.id, menu: JSON.parse(@menu) }))
      @$el.hide()

      @

    on_show: ->
      @$el.fadeIn 500

    select: (e) ->
      $link = $ e.currentTarget
      @$el.find("a").removeClass "active"
      $link.addClass "active"