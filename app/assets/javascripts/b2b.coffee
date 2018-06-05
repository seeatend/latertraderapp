# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#product_request_product_id').parent().hide()
  products = $('#product_request_product_id').html()
  $('#product_request_seller_id').change ->
    seller = $('#product_request_seller_id :selected').text()
    escaped_seller = seller.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(products).filter("optgroup[label='#{escaped_seller}']").html()
    if options
      $('#product_request_product_id').html(options)
      $('#product_request_product_id').parent().show()
    else
      $('#product_request_product_id').empty()
      $('#product_request_product_id').parent().hide()