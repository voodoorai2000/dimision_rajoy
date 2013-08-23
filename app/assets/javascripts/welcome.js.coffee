# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

if $('#verification_phone').val()?.length == 0
  $('#verification_phone').val('+34 ')

$('#submit').click ->
  $('#form').submit()
  return false