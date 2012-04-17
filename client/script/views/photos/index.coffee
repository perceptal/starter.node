define ["jquery", "cs!lib/collection_view", "cs!./photo"], ($, View, PhotoView) ->

  class IndexView extends View
    initialize: ->
      @render()

    render: ->
      self = @
      @reset()

      @collection.each((item) ->
        view = new PhotoView({ model: item })

        self.$el.append(view.render().$el)
      )

      @$el.hide()

      this

    on_show: ->
      @$el.fadeIn 500

    reset: ->
      @$el.empty()
