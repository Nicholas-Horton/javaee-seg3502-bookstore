$(document).ready ->
  updateSubtotal()
  $(".cart-quantity-input").bind "keyup change", ->
    updateSubtotal()
  $(".delete-button").bind "click", ->
    deleteBook(this)
  $(".undo").bind "click", ->
    undo(this)

updateSubtotal = () ->
  book1Quantity = $('#book1-quantity:visible')?.val() || 0
  book2Quantity = $('#book2-quantity:visible')?.val() || 0
  book1Price = $('#book1-price:visible')?.val()?.replace('$', '') || 0
  book2Price = $('#book2-price:visible')?.val()?.replace('$', '') || 0
  subtotal = $('#subtotal')
  temp = (book1Quantity * book1Price + book2Quantity * book2Price).toFixed(2)
  subtotal.val("$" + temp)

deleteBook = (deleteButton) ->
  $(deleteButton).parent().parent().parent().hide()
  $(deleteButton).parent().parent().parent().next().show()
  updateSubtotal()

undo = (undoButton) ->
  $(undoButton).parent().parent().prev().show()
  $(undoButton).parent().parent().hide()
  updateSubtotal()
