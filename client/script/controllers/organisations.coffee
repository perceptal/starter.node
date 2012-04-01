define [
    "cs!lib/mediator"
  , "cs!lib/region"
  , "cs!lib/controller"
  , "cs!models/organisations"
  , "cs!models/organisation"
  , "cs!views/organisations/index"
  , "cs!views/organisations/show"
  , "cs!views/navigation/collection"
  , "cs!views/navigation/model"
  , "text!data/navigation/organisations.json"
  , "text!data/navigation/organisation.json"
], (mediator, Region, Controller, Organisations, Organisation, IndexView, ShowView, CollectionMenuView, ModelMenuView, organisations, organisation) ->

  class OrganisationsController extends Controller

    collection_menu: (q) ->
      @collection_menu_region.show new CollectionMenuView({ collection_name: @name, menu: organisations, query: q or= "" })

    model_menu: (model) ->
      @model_menu_region.show new ModelMenuView({ model: model, menu: organisation })

    initialize: ->
      @name = "organisations"

      mediator.subscribe "organisations:search", @search, @
      mediator.subscribe "organisations:select", @show, @

      @main_region = new Region({ el: "#body .content" })
      @collection_menu_region = new Region({ el: "#body header" })
      @model_menu_region = new Region({ el: "#body .content", method: "append" })

    index: ->
      self = @
      collection = new Organisations()

      collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: collection)

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

    show: (id) ->
      self = @
      model = new Organisation({ _id: id })

      model.fetch
        success: ->
          self.main_region.show new ShowView(model: model)
          self.model_menu model

          self.router.navigate "administration/organisations/" + id

        error: (model, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

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
          self.collection_menu(q)
          self.router.navigate "administration/organisations/search/" + q
          mediator.publish "organisations:searched"
