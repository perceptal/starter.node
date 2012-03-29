define ["jquery", "cs!lib/item_view", "hbs!templates/members/member"], ($, View, template) ->

  class MemberView extends View
    tagName: "article"
    className: "list"

    render: ->
      @$el.html(template(@model.toJSON()))

      this
