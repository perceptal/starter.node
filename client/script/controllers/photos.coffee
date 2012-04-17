define [
  "cs!lib/mediator"
  , "cs!lib/region"
  , "cs!lib/controller"
  , "cs!models/members"
  , "cs!models/photos"
  , "cs!views/members/show"
  , "cs!views/photos/index"
  , "cs!views/navigation/collection"
  , "cs!views/navigation/model"
  , "text!data/navigation/members.json"
  , "text!data/navigation/member.json"
], (mediator, Region, Controller, Members, Photos, ShowView, IndexView, CollectionMenuView, ModelMenuView, members, member) ->

  class PhotosController extends Controller

    collection_menu: (q) ->
      @collection_menu_region.show new CollectionMenuView({ collection_name: @name, menu: members, query: q or= "" })

    model_menu: (model) ->
      @model_menu_region.show new ModelMenuView({ model: model, menu: member })

    initialize: ->
      @name = "members"
      @collection = new Members()

      @main_region            = new Region({ el: "#body .content" })
      @collection_menu_region = new Region({ el: "#body header" })
      @model_menu_region      = new Region({ el: "#body .content", method: "append" })
      @data_region            = new Region({ el: "#body .content", method: "append" })

    index: (member_id) ->
      self = @

      @collection.find
        id: member_id

        success: (model) ->
 
          collection = new Photos({ member_id: member_id })
          collection.fetch
            success: ->
              self.main_region.show new ShowView(model: model)
              self.model_menu model
              self.data_region.show new IndexView(collection: collection)
              self.router.navigate "members/" + member_id + "/photos"

        error: (data, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

      upload: (member_id) ->
        self = @