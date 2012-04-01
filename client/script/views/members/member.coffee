define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/members/member"], ($, mediator, View, template) ->

  class MemberView extends View
    tagName: "article"
    className: "list"

    events:
      "click":          "select"
      "click a.select": "select"

    render: ->
      @$el.html(template(@model.toJSON()))

      this

    select: ->
      mediator.publish "members:select", @model.id

