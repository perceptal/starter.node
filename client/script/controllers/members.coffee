define [
  "cs!lib/mediator"
  , "cs!lib/region"
  , "cs!lib/controller"
  , "cs!models/members"
  , "cs!models/member"
  , "cs!views/members/index"
  , "cs!views/members/show"
  , "cs!views/navigation/actions"
  , "text!data/navigation/members.json"
], (mediator, Region, Controller, Members, Member, IndexView, ShowView, ActionsView, actions) ->

  class MembersController extends Controller

    actions: (q) ->
      @actions_region.show new ActionsView({ search_for: "members", actions: actions, query: q or= "" })

    initialize: ->
      @name = "members"

      mediator.subscribe "members:search", @search, @
      mediator.subscribe "members:select", @show, @

      @main_region = new Region({ el: "#body .content" })
      @actions_region = new Region({ el: "#body header" })

    index: ->
      self = @
      collection = new Members()

      collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: collection)

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.actions()

    show: (id) ->
      console.log id
      self = @
      model = new Member({ _id: id })

      model.fetch
        success: ->
          self.main_region.show new ShowView(model: model)
          self.router.navigate "members/" + id

        error: (model, res) ->
          self.error res.responseText

        complete: ->
          self.actions()

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
          self.actions(q)
          self.router.navigate "members/search/" + q
          mediator.publish "members:searched"
