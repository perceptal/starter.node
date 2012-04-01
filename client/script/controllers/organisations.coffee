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

    actions: (q) ->
      @actions_region.show new ActionsView({ search_for: "organisations", actions: actions, query: q or= "" })

    initialize: ->
      @name = "organisations"

      mediator.subscribe "organisations:search", @search, @
      mediator.subscribe "organisations:select", @show, @

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
          self.actions()

    show: (id) ->
      self = @
      model = new Organisation({ _id: id })

      model.fetch
        success: ->
          self.main_region.show new ShowView(model: model)

          self.router.navigate "administration/organisations/" + id

        error: (model, res) ->
          self.error res.responseText

        complete: ->
          self.actions()

    search: (q) ->
      return if q.length == 0

      self = @
      collection = new Organisations()
      collection.url = collection.search_url q

      collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: collection)

          self.warning "No organisations found" if collection.isEmpty()

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.actions(q)
          self.router.navigate "administration/organisations/search/" + q
          mediator.publish "organisations:searched"
