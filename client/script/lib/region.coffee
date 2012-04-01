define ["jquery", "backbone"], ($, Backbone) ->

  class Region
    close: (view) ->
      view.dispose() if view and view.dispose

    open: (view) ->
      view.render()

      @$el[@method or= "html"](view.el)

      view.on_show() if view.on_show

    ensure_el: ->
      @$el = @get_el(@el) if not @$el or @$el.length is 0

    get_el: (selector) ->
      $ selector

    constructor: (options) ->
      @options = options or {}
      _.extend @, options

      unless @el
        throw new Error "No el is supplied"

    show: (view) ->
      @ensure_el()

      @close @current_view
      @current_view = view
      @open @current_view
