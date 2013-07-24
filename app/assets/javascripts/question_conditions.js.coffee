# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $("table#answers > tbody").append($(this).data('fields'))
    event.preventDefault()

$('form').on 'click', '.remove_answer', (event) ->
  $(this).parents('tr').remove()
  event.preventDefault()