define ["underscore", "backbone", "cs!./subscriber"], (_, Backbone, Subscriber) ->

  class Collection extends Backbone.Collection

    _(Collection.prototype).defaults Subscriber

    find: (options) ->
      self = @

      model = @get options.id
      console.log model

      if model == undefined

        model = new @model({ _id: options.id })

        model.fetch
          success: ->
            options.success(model)

          error: ->
            options.error()

          complete: ->
            options.complete()

      else
        options.success model
        options.complete()

    search: (options) ->
      self = @

      @url = @urlRoot + "search/" + options.query

      @fetch
        success: ->
          options.success()

        error: (data, res) ->
          options.error(data, res)

        complete: ->
          options.complete()
          self.url = self.urlRoot

    log: ->
      console.log arguments

    disposed: false

    dispose: ->
      return if @disposed

      @unsubscribe_all_events()

      @disposed = true
