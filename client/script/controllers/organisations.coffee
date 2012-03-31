define [
    "cs!lib/mediator"
  , "cs!lib/region"
  , "cs!lib/controller"
  , "cs!models/organisations"
  , "cs!models/organisation"
  , "cs!views/organisations/index"
  , "cs!views/organisations/show"
  , "cs!views/navigation/actions"
  , "text!data/navigation/organisations.json"
], (mediator, Region, Controller, Organisations,Organisation, IndexView, ShowView, ActionsView, menu) ->

  class OrganisationsController extends Controller

    initialize: ->
      @name = "organisations"

      mediator.subscribe "organisations:search", @search, @
      mediator.subscribe "organisation:select", @show, @

      @main_region = new Region({ el: "#body .content" })
      @actions_region = new Region({ el: "#body header" })

    index: ->
      self = @
      collection = new Organisations()

      collection.fetch
        success: ->
          self.actions_region.show new ActionsView({ search_for: "organisations", actions: menu })
          self.main_region.show new IndexView(collection: collection)

    show: (id) ->
      self = @
      model = new Organisation({ id: id })

      model.fetch
        success: ->
          self.actions_region.show new ActionsView({ search_for: "organisations", actions: menu })
          self.main_region.show new ShowView(model: model)

    search: (q) ->
      return if q.length == 0

      self = @
      collection = new Organisations()
      collection.url = collection.search_url q

      collection.fetch
        success: ->
          self.actions_region.show new ActionsView({ search_for: "organisations", actions: menu, query: q })
          self.main_region.show new IndexView(collection: collection)

          mediator.publish "organisations:searched"

          self.router.navigate "organisations/search/" + q

          self.warning "No matching organisations found" if collection.isEmpty()
