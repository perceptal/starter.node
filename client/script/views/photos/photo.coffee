define ["jquery", "cs!lib/mediator", "cs!lib/view", "hbs!templates/photos/photo"], ($, mediator, View, template) ->

  class MemberView extends View
    tagName: "article"
    className: "photo"

    events:
      "click"           : "open"
      "click a.default" : "default"
      "click a.delete"  : "delete"

    render: ->
      @$el.html(template(@model.toJSON()))

      this

    open: ->
 
    default: ->
 
    delete: ->
 
