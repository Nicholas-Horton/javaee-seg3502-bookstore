$(document).ready ->
  $('.book-search-input').bind 'keyup change', ->
    filterBooks()
  $('#clear-button').bind 'click', ->
    clearFilters()
  updateSearchResults()

filterBooks = () ->
  title = $('#title').val().toLowerCase()
  author = $('#author').val().toLowerCase()
  category = $('#category').val().toLowerCase()
  minYear = $('#min-year').val().toLowerCase() || 0
  maxYear = $('#max-year').val().toLowerCase() || 2020
  rating = $('#min-rating').val().toLowerCase()
  minPrice = $('#min-price').val().toLowerCase() || 0
  maxPrice = $('#max-price').val().toLowerCase() || 9999

  matchingResults = $(".book-result")
  matchingResults = matchingResults.filter ->
    $(".book-title",this).text().toLowerCase().indexOf(title) != -1
  matchingResults = matchingResults.filter ->
    $('.year',this).text() >= minYear && $('.year',this).text() <= maxYear
  matchingResults = matchingResults.filter ->
    $(".author",this).text().toLowerCase().indexOf(author) != -1
  matchingResults = matchingResults.filter ->
    $(".category",this).text().toLowerCase().indexOf(category) != -1
  matchingResults = matchingResults.filter ->
    r = $('.rating',this).first().children('.fa-star').length + $('.rating').first().children('.fa-star-half-o').length / 2
    r >= rating
  matchingResults = matchingResults.filter ->
    $('.price',this).text().replace('$','').trim() >= minPrice && $('.price',this).text().replace('$','').trim() <= maxPrice

  results = $(".book-result")
  results.hide()
  matchingResults.show()
  updateSearchResults()

updateSearchResults = () ->
  n = $('.book-result:visible').length
  $('.search-results-message').html("#{n} search results")

clearFilters = () ->
  $('#title').val('')
  $('#author').val('')
  $('#category').val('')
  $('#min-year').val('')
  $('#max-year').val('')
  $('#min-rating').val('')
  $('#min-price').val('')
  $('#max-price').val('')
  filterBooks()