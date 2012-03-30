define ["cs!lib/mediator", "cs!lib/region", "cs!lib/controller", "cs!models/members", "cs!models/member", "cs!views/members/index", "cs!views/members/show", "cs!views/navigation/members/actions"], (mediator, Region, Controller, Members, Member, IndexView, ShowView, ActionsView) ->

  class MembersController extends Controller

    initialize: ->
      mediator.subscribe "members:search", @search, @

      @main_region = new Region({ el: "#body .content" })
      @actions_region = new Region({ el: "#body header" })

    index: ->
      collection = new Members()

      ar = @actions_region
      mr = @main_region

      collection.fetch
        success: ->
          ar.show new ActionsView()
          mr.show new IndexView(collection: collection)

    show: (id) ->
      model = new Member({ id: id })

      ar = @actions_region
      mr = @main_region

      model.fetch
        success: ->
          ar.show new ActionsView()
          mr.show new ShowView(model: model)

    search: (q) ->
      return if q.length == 0

      collection = new Members()
      collection.url = collection.search_url q

      ar = @actions_region
      mr = @main_region

      collection.fetch
        success: ->
          ar.show new ActionsView(query: q)
          mr.show new IndexView(collection: collection)

          mediator.publish "members:searched"
