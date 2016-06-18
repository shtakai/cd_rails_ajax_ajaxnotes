# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.submit').toggle()

  $('form').click ->
    console.log(@.id)
    $(@).children('.submit').toggle()
    if($(@).children('textarea').attr('disabled'))
      $(@).children('textarea').removeAttr('disabled')
    else
      $(@).children('textarea').attr('disabled','')




