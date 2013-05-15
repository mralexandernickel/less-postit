$ = jQuery

config =
  # available colour classes, defined in postit.less
  colours: ["red-dark","green-light","green-dark"]
  # possible rotations in degrees
  degrees: [-5..5]

methods =
  init: (options) ->
    for postit in $(this)
      rotation = methods.get_random_array_item [-5..5]
      $(postit).addClass methods.get_random_array_item config.colours
      $(postit).css
        "-webkit-transform": "rotate(#{rotation}deg)"
        "-moz-transform": "rotate(#{rotation}deg)"
        "-ms-transform": "rotate(#{rotation}deg)"
        "-o-transform": "rotate(#{rotation}deg)"
        "transform": "rotate(#{rotation}deg)"
        "display": "block"
  
  get_random_array_item: (array) -> array[Math.floor(Math.random()*array.length)]

$.fn.less_postit = (method,options...) ->
  if methods[method]
    methods[method].apply this, options
  else if typeof method is "object" or not method
    methods.init.apply this, arguments
  else
    $.error "Method " + method + " does not exist in Postits"

# init on domready
$ -> $(".postit").less_postit()