define [
  "cs!lib/mediator"
  , "cs!lib/region"
  , "cs!lib/controller"
  , "cs!models/members"
  , "cs!views/members/index"
  , "cs!views/members/show"
  , "cs!views/navigation/collection"
  , "cs!views/navigation/model"
  , "text!data/navigation/members.json"
  , "text!data/navigation/member.json"
], (mediator, Region, Controller, Members, IndexView, ShowView, CollectionMenuView, ModelMenuView, members, member) ->

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

    index: (member_id) ->
      self = @

      @collection.find
        id: member_id

        success: (model) ->
          self.main_region.show new ShowView(model: model)
          self.model_menu model

          self.router.navigate "members/" + member_id + "/photos"

        error: (data, res) ->
          self.error res.responseText

        complete: ->
          self.collection_menu()

      upload: (member_id) ->
        self = @