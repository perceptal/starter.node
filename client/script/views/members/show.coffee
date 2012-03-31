define ["jquery", "cs!lib/view", "cs!views/members/member"], ($, View, MemberView) ->

  class ShowView extends View
    initialize: ->
      @render()

    render: ->
      @reset()

      view = new MemberView({ model: @model, className: "item" })

      @$el.append(view.render().$el)
      @$el.hide()

      this

    on_show: ->
      @$el.fadeIn 500

    reset: ->
      @$el.empty()
