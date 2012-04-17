define ["underscore", "backbone", "cs!./subscriber"], (_, Backbone, Subscriber) ->

  class Collection extends Backbone.Collection

    _(Collection.prototype).defaults Subscriber

    sync: Backbone.syncLocal if @supports_local_storage

    supports_local_storage: false

    find: (options) ->
      self = @

      model = @get options.id

      if _.isUndefined model

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
