define ["./region", "./item_view"], (Region, View) ->

  class Layout extends View

    region_managers: {}

    constructor: ->
      View.apply @, arguments

    render: ->
      @init_regions()
      View::render.call @, arguments

    close: ->
      @close_regions()
      View::dispose.call @, arguments

    init_regions: ->
      self = @

      _.each @regions, (selector, name) ->

        manager = new Region
          el:     selector
          get_el: (selector) ->
            self.$(selector)

        self.region_managers[name] = manager
        self[name] = manager


    close_regions: ->
      self = @

      _.each @region_managers, (manager, name) ->
        manager.close()

        delete self[name]

      @region_managers = {}
