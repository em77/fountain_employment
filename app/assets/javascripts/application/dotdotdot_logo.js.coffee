$(document).on "page:change", ->
  $('#mycarousel').carousel interval: 3000
  $('.logo_medium').dotdotdot {
    height: 175
  }
  $('.active.item').each (index) ->
    if index != 0
      $(this).removeClass 'active'

  $('#mycarousel').bind 'slid', ->
    $('.carousel-linked-nav .active').removeClass 'active'
    idx = $('#mycarousel .item.active').index()
    $('.carousel-linked-nav li:eq(' + idx + ')').addClass 'active'
    return
