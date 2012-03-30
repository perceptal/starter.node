define ["cs!lib/mediator", "cs!lib/region", "cs!lib/controller", "cs!models/organisations", "cs!models/organisation", "cs!views/organisations/index", "cs!views/organisations/show", "cs!views/navigation/organisations/actions"], (mediator, Region, Controller, Organisations,Organisation, IndexView, ShowView, ActionsView) ->

  class OrganisationsController extends Controller

    initialize: ->
      mediator.subscribe "organisations:search", @search, @

      @main_region = new Region({ el: "#body .content" })
      @actions_region = new Region({ el: "#body header" })

    index: ->
      collection = new Organisations()

      ar = @actions_region
      mr = @main_region

      collection.fetch
        success: ->
          ar.show new ActionsView()
          mr.show new IndexView(collection: collection)

    show: (id) ->
      model = new Organisation({ id: id })

      ar = @actions_region
      mr = @main_region

      model.fetch
        success: ->
          ar.show new ActionsView()
          mr.show new ShowView(model: model)

    search: (q) ->
      return if q.length == 0

      collection = new Organisations()
      collection.url = collection.search_url q

      ar = @actions_region
      mr = @main_region

      collection.fetch
        success: ->
          ar.show new ActionsView(query: q)
          mr.show new IndexView(collection: collection)

          mediator.publish "organisations:searched"
