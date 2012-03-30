define ["underscore", "cs!./region", "cs!views/navigation/index"], (_, Region, View) ->

  class Navigation

    constructor: (options) ->
      @options = options or {}
      _.extend @, options

      @render()

    render: ->
      console.log @menu
      console.log @el

      region = new Region(el: @el)
      region.show new View(menu: @menu)
