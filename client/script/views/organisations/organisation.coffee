define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/organisations/organisation"], ($, mediator, View, template) ->

  class OrgView extends View
    tagName: "article"
    className: "list"

    events:
      "click":          "select"
      "click a.select": "select"

    render: ->
      @$el.html(template(@model.toJSON()))

      this

    select: ->
      mediator.publish "organisations:select", @model.id
