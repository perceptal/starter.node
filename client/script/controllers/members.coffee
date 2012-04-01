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

    initialize: ->
      @name = "members"

      mediator.subscribe "members:search", @search, @
      mediator.subscribe "member:select", @show, @

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
          self.actions_region.show new ActionsView({ search_for: "members", actions: actions })

    show: (id) ->

      self = @
      model = new Member({ id: id })

      model.fetch
        success: ->
          self.main_region.show new ShowView(model: model)

          self.router.navigate "members/" + id

        error: (model, res) ->
          self.error res.responseText

        complete: ->
          self.actions_region.show new ActionsView({ search_for: "members", actions: actions })

    search: (q) ->
      return if q.length == 0

      self = @
      collection = new Members()
      collection.url = collection.search_url q

      collection.fetch
        success: ->
          self.main_region.show new IndexView(collection: collection)

          mediator.publish "members:searched"

          self.router.navigate "members/search/" + q

          self.warning "No members found" if collection.isEmpty()

        error: (collection, res) ->
          self.error res.responseText

        complete: ->
          self.actions_region.show new ActionsView({ search_for: "members", actions: actions })
