define ["underscore", "backbone", "cs!./mediator"], (_, Backbone, mediator) ->

  class Router extends Backbone.Router

    constructor: (options) ->
      Backbone.Router::constructor.call this, options

      if @app_routes
        controller = @controller
        controller = options.controller if options and options.controller

        @process_app_routes controller, @app_routes

    process_app_routes: (controller, app_routes) ->
      routes = []
      router = @

      for route of app_routes
        routes.unshift [route, app_routes[route]]

      i = 0

      while i < routes.length
        route = routes[i][0]
        method_name = routes[i][1]
        method = _.bind(controller[method_name], controller)

        router.route route, method_name, method

        #mediator.publish ["navigate", controller.name, method_name].join ":"

        i++
