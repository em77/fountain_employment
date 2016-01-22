# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  selection = $("#effects-working")
  $("#slide-toggler").click ->
    if $("#subtract-num").is ':hidden'
      selection.css "padding-top": "115px"
    else
      selection.css "padding-top": "0px"
    $('#subtract-num').slideToggle()
    return
