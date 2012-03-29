define ["backbone", "cs!lib/region", "cs!lib/controller", "cs!views/navigation/main", "cs!routers/home", "cs!routers/members"], (Backbone, Region, Controller, NavView, HomeRouter, MembersRouter) ->

  class ApplicationController extends Controller

    initialize: ->
      region = new Region({ el: "nav#main" })
      region.show new NavView()

      new HomeRouter()
      new MembersRouter()

      Backbone.history.start()
