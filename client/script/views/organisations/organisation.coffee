define ["jquery", "cs!lib/item_view", "hbs!templates/organisations/organisation"], ($, View, template) ->

  class OrgView extends View
    tagName: "article"
    className: "list"

    render: ->
      @$el.html(template(@model.toJSON()))

      this
