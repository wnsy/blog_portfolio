# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# based on tutorial how to use html5sortable
ready = undefined
set_positions = undefined

# syntax like es6 function
set_positions = ->
  $('.col-md-4').each (i) ->
    # this .card. assign data-pos to i,
    $(this).attr 'data-pos', i + 1
    return
  return

# ready when the page loads
ready = ->
  set_positions()
  $('.sortable').sortable()
  # bind the event for sortupdate when you drag item
  $('.sortable').sortable().bind 'sortupdate', (item, ui) ->
    updated_order = []
    set_positions() # refresh the position
    $('.col-md-4').each (i) ->
      updated_order.push
        id: $(this).data('id') # id from the card, then update the array
        position: i + 1
      return
    $.ajax # communicate with rails
      type: 'PUT'
      url: '/portfolios/sort' # will create a controller action called 'sort'
      data: order: updated_order # params hash to update inside portfolio
    return
  return

$( document ).ready ready
