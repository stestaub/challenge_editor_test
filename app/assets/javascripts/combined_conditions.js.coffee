# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$(".ui-sortable").sortable(
		update: (event, ui) ->
			for item in $(".ui-sortable").find('input[type=hidden]._order')
				item = $(item)
				item.val(item.closest('li').index())
	)


	$('form').on 'click', '.remove_condition', (event) ->
	  $(this).parents('li').remove()
	  event.preventDefault()

	$('form').on 'click', '.add_condition', (event) ->
	    time = new Date().getTime
	    regexp = new RegExp($(this).data('_order_value'), 'g')
	    $("#conditions").append($(this).data('condition'))
	    $(this).parents('tr').remove()
	    event.preventDefault()