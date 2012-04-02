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
    className: "model "

    query: ""

    events:
      "click     a"          : "select"

      "mouseover a.page"     : "show_page_menu"
      "mouseout  a.page"     : "hide_page_menu"
      "mouseover nav.page"   : "cancel_hide"
      "mouseout  nav.page"   : "hide_page_menu"

      "mouseover a.action"   : "show_action_menu"
      "mouseout  a.action"   : "hide_action_menu"
      "mouseover nav.action" : "cancel_hide"
      "mouseout  nav.action" : "hide_action_menu"

    initialize: ->
      @menu = @options.menu if @options.menu

      @menu = util.inject @menu, "menu", "id", @model.id

      @render()

    render: ->
      @$el.html(template({ id: @model.id, classifier: "page", menu: JSON.parse(@menu) }))
      @$el.append(template({ id: @model.id, classifier: "action", menu: JSON.parse(@menu) }))

      @

    on_show: ->
      self = @

    select: (e) ->
      $link = $ e.currentTarget
      @$el.find("a").removeClass "active"
      $link.addClass "active"

      hide_menu @, "page"
      hide_menu @, "action"

      select_item @, $link

    menu_display_hack = (self) ->
      self.$el.removeClass "hack"
      self.$el.addClass "hack" if (self.$("nav.page ul").is(":visible"))

    show_menu = (self, menu) ->
      self.$("nav." + menu + " ul").css("display", "table")
      menu_display_hack(self)

    hide_menu_on_delay = (self, menu) ->
      timer.delay(250, (->
        hide_menu self, menu
      ), @)

    hide_menu = (self, menu) ->
      self.$("nav." + menu + " ul").hide()
      menu_display_hack(self)

    select_item = (self, $link) ->
      menu = $link.data("classifier")
      self.$("nav." + menu + " a." + menu)
        .attr("href", $link.attr("href"))
        .text( $link.text())
        .addClass("active")

    show_page_menu: ->
      show_menu @, "page"
      hide_menu @, "action"

    hide_page_menu: ->
      hide_menu_on_delay @, "page"

    show_action_menu: ->
      show_menu @, "action"
      hide_menu @, "page"

    hide_action_menu: ->
      hide_menu_on_delay @, "action"

    cancel_hide: ->
      timer.cancel()

