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
], (mediator, Region, Controller, Organisations, Organisation, IndexView, ShowView, ActionsView, actions) ->

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
          self.main_region.show new IndexView(collection: collection)

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.actions_region.show new ActionsView({ search_for: "organisations", actions: actions })

    show: (id) ->

      self = @
      model = new Organisation({ id: id })

      model.fetch
        success: ->
          self.main_region.show new ShowView(model: model)

          self.router.navigate "organisations/" + id

        error: (model, res) ->
          self.error res.responseText

        complete: ->
          self.actions_region.show new ActionsView({ search_for: "organisations", actions: actions })

    search: (q) ->
      return if q.length == 0

      self = @
      collection = new Organisations()
      collection.url = collection.search_url q

      collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: collection)

          mediator.publish "organisations:searched"

          self.router.navigate "organisations/search/" + q

          self.warning "No organisations found" if collection.isEmpty()

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.actions_region.show new ActionsView({ search_for: "organisations", actions: actions })
