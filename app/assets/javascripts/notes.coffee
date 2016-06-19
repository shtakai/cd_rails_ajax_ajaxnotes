# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.submit').toggle()

  $('form').click ->
    console.log(@.id)
    $(@).children('.submit').toggle()
    if($(@).children('textarea').attr('readonly'))
      $(@).children('textarea').removeAttr('readonly')
    else
      $(@).children('textarea').attr('readonly','')

  $('form').on('ajax:success', (e, data, status) ->
    console.log(data)
    target_id = data.delete
    console.log(target_id)
    $('#'+target_id).remove()
  )




