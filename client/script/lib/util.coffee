define ["jquery", "underscore"], ($, _) ->

  centre: ($el) ->
    $el.css
      top: ($(window).scrollTop() + 175) + "px"
      left: "50%"
      margin: "-" + ($el.height() / 2) + "px 0 0 -" + ($el.width() / 2) + "px"

  inject: (json, item, key, value) ->

    parsed = JSON.parse json

    _.each(parsed[item], (i) ->
      i[key] = value
    )

    JSON.stringify(parsed)
