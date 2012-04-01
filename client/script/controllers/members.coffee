define [
  "cs!lib/mediator"
  , "cs!lib/region"
  , "cs!lib/controller"
  , "cs!models/members"
  , "cs!models/member"
  , "cs!views/members/index"
  , "cs!views/members/show"
  , "cs!views/navigation/collection"
  , "cs!views/navigation/model"
  , "text!data/navigation/members.json"
  , "text!data/navigation/member.json"
], (mediator, Region, Controller, Members, Member, IndexView, ShowView, CollectionMenuView, ModelMenuView, members, member) ->

  class MembersController extends Controller

    collection_menu: (q) ->
      @collection_menu_region.show new CollectionMenuView({ collection_name: @name, menu: members, query: q or= "" })

    model_menu: (model) ->
      @model_menu_region.show new ModelMenuView({ model: model, menu: member })

    initialize: ->
      @name = "members"

      mediator.subscribe "members:search", @search, @
      mediator.subscribe "members:select", @show, @

      @main_region = new Region({ el: "#body .content" })
      @collection_menu_region = new Region({ el: "#body header" })
      @model_menu_region = new Region({ el: "#body .content", method: "append" })

    index: ->
      self = @
      collection = new Members()

      collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: collection)

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

    show: (id) ->
      self = @
      model = new Member({ _id: id })

      model.fetch
        success: ->
          self.main_region.show new ShowView(model: model)
          self.model_menu model
          self.router.navigate "members/" + id

        error: (model, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

    search: (q) ->
      return if q.length == 0

      self = @
      collection = new Members()
      collection.url = collection.search_url q

      collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: collection)

          self.warning "No members found" if collection.isEmpty()

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu(q)
          self.router.navigate "members/search/" + q
          mediator.publish "members:searched"
