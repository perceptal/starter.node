define ["cs!lib/router", "cs!controllers/organisations"], (Router, Controller) ->

  class OrganisationsRouter extends Router
    app_routes:
      "administration"                          : "index"
      "administration/organisations"            : "index"
      "administration/organisations/search/:q"  : "search"
      "administration/organisations/:id"        : "show"

    controller: new Controller()
