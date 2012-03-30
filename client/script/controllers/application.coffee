define ["backbone", "cs!lib/region", "cs!lib/controller", "cs!views/navigation/main", "cs!routers/home", "cs!routers/organisations", "cs!routers/members"], (Backbone, Region, Controller, NavView, HomeRouter, OrganisationsRouter, MembersRouter) ->

  class ApplicationController extends Controller

    initialize: ->
      region = new Region({ el: "nav#main" })
      region.show new NavView()

      new HomeRouter()
      new OrganisationsRouter()
      new MembersRouter()

      Backbone.history.start()
