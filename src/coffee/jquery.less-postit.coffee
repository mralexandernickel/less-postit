$ = jQuery

config =
  # available colour classes, defined in postit.less
  colours: ["red-dark","green-light","green-dark"]
  # possible rotation classes defined in posit.less
  degrees: ["minus_5","minus_4","minus_3","minus_2","minus_1","plusminus","plus_1","plus_2","plus_3","plus_4","plus_5"]

methods =
  init: (options) ->
    for postit in $(this)
      $(postit).addClass methods.get_random_array_item config.colours
      $(postit).addClass methods.get_random_array_item config.degrees
  
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