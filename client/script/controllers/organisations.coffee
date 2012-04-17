define [
    "cs!lib/mediator"
  , "cs!lib/region"
  , "cs!lib/controller"
  , "cs!models/organisations"
  , "cs!views/organisations/index"
  , "cs!views/organisations/show"
  , "cs!views/navigation/collection"
  , "cs!views/navigation/model"
  , "text!data/navigation/organisations.json"
  , "text!data/navigation/organisation.json"
], (mediator, Region, Controller, Organisations, IndexView, ShowView, CollectionMenuView, ModelMenuView, organisations, organisation) ->

  class OrganisationsController extends Controller

    collection_menu: (q) ->
      @collection_menu_region.show new CollectionMenuView({ collection_name: @name, menu: organisations, query: q or= "" })

    model_menu: (model) ->
      @model_menu_region.show new ModelMenuView({ model: model, menu: organisation })

    initialize: ->
      @name = "organisations"
      @collection = new Organisations()

      mediator.subscribe "organisations:search", @search, @
      mediator.subscribe "organisations:select", @show, @

      @main_region            = new Region({ el: "#body .content" })
      @collection_menu_region = new Region({ el: "#body header" })
      @model_menu_region      = new Region({ el: "#body .content", method: "append" })

    index: ->
      self = @

      @collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: self.collection)

        error: (data, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

    show: (id) ->
      self = @

      @collection.find
        id: id

        success: (model) ->
          self.main_region.show new ShowView(model: model)
          self.model_menu model

          self.router.navigate "administration/organisations/" + id

        error: (data, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

    search: (q) ->
      return if q.length == 0

      self = @

      @collection.search
        query: q

        success: ->
          self.main_region.show new IndexView(collection: self.collection)

          self.warning "No organisations found" if self.collection.isEmpty()

        error: (data, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu(q)
          self.router.navigate "administration/organisations/search/" + q

          mediator.publish "organisations:searched"
