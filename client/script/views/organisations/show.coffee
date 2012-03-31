define ["jquery", "cs!lib/view", "cs!./organisation"], ($, View, OrgView) ->

  class ShowView extends View
    initialize: ->
      @render()

    render: ->
      @reset()

      view = new OrgView({ model: @model, className: "item" })

      @$el.append(view.render().$el)
      @$el.hide()

      this

    on_show: ->
      @$el.fadeIn 500

    reset: ->
      @$el.empty()
