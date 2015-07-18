$(document).ready ->
  $('#browse-button').bind 'click', ->
    $('#browse-menu').toggle('drop', {direction: 'up'})
