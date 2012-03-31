define [
    "backbone"
  , "cs!lib/navigation"
  , "cs!lib/dialog"
  , "cs!lib/controller"
  , "cs!routers/home"
  , "cs!routers/organisations"
  , "cs!routers/members"
  , "text!data/navigation/main.json"
  , "text!data/navigation/support.json"
  , "text!data/navigation/user.json"
], (Backbone, Navigation, Dialog, Controller, HomeRouter, OrganisationsRouter, MembersRouter, main, support, user) ->

  class ApplicationController extends Controller

    initialize: ->
      new Navigation({ el: "nav#main", menu: main })
      new Navigation({ el: "footer nav", menu: support })
      new Navigation({ el: "#sidebar nav", menu: user })

      new Dialog()

      new HomeRouter()
      new OrganisationsRouter()
      new MembersRouter()

      Backbone.history.start()
