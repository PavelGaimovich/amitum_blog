# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.js-clickable-row').click ->
    window.location.replace(this.dataset.href)

  $('.js-category-selection').click (event) ->
    event.preventDefault()

    $this = $(this)
    $selector = $('.js-category-selector')
    if selector_value = $selector.val()
      $selector.val(selector_value + ', ' + $this.text())
    else
      $selector.val($this.text())
