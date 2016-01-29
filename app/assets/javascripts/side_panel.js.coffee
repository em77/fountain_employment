$(document).on "page:change", ->
  $('.opener, .fade-panel').on 'click', ->
    panel = $('.fade-panel')
    $(panel).toggle 'fade'
    $(chevron).toggleClass 'glyphicon-chevron-right'
    $(chevron).toggleClass 'glyphicon-chevron-left'
    false
  return
