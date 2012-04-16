define ["cs!lib/collection", "cs!./member"], (Collection, Organisation) ->

  class Organisations extends Collection

    model:    Organisation

    urlRoot:  "/people/"

    initialize: ->
      @url = @urlRoot

    search: (options) ->
      self = @

      @url = "search/" + options.query

      @fetch
        success: ->
          options.success()

        error: (data, res) ->
          options.error(data, res)
          
        complete: ->
          options.complete()
          self.url = self.urlRoot
