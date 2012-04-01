define ["jquery"], ($) ->

  centre: ($el) ->
    $el.css
      top: ($(window).scrollTop() + 175) + "px"
      left: "50%"
      margin: "-" + ($el.height() / 2) + "px 0 0 -" + ($el.width() / 2) + "px"
