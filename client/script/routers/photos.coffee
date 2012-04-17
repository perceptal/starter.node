define ["cs!lib/router", "cs!controllers/photos"], (Router, Controller) ->

  class PhotosRouter extends Router
    app_routes:
      "members/:member_id/photos"      : "index"

    controller: new Controller()
