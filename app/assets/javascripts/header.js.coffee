$(document).ready ->
  $('#browse-button').bind 'click', ->
    $('#browse-menu').toggle('drop', {direction: 'up'})
  $('#book-search').bind 'keyup', (e) ->
    if e.keyCode == 13
      window.location.href = 'book_search.html';