define [
    "jquery"
  , "cs!lib/mediator"
  , "cs!lib/timer"
  , "cs!lib/view"
  , "hbs!templates/navigation/collection"
], ($, mediator, timer, View, template) ->

  class CollectionView extends View
    tagName: "nav"
    className: "collection "

    query: ""

    events:
      "click a": "select"

    search_input: -> @$("." + @collection_name + " input.search")

    initialize: ->
      @collection_name = @options.collection_name if @options.collection_name
      @query = @options.query if @options.query
      @menu = @options.menu if @options.menu
      @className += @collection_name

      mediator.subscribe @collection_name + ":searched", @focus, @

      #@subscribe_event @collection_name + ":searched", @focus, @

      @render()

    render: ->
      @$el.html(template({ collection_name: @collection_name, q: @query, menu: JSON.parse(@menu) }))

      @

    on_show: ->
      self = @

      @search_input().bind "keyup", -> timer.delay(500, self.search, self)

    select: (e) ->
      $link = $ e.currentTarget

      @$el.find("a").removeClass "active"

      $link.addClass "active"

    search: ->
      q = @search_input().val()

      @$el.find("a").removeClass "active"
      @search_input().addClass("searching")

      mediator.publish @collection_name + ":search", q

    focus: ->
      $search = @search_input()
      $search.focus()
      $search.val($search.val())

