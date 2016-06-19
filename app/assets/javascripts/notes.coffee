# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.submit').toggle()

  $('body').on('click', 'form', (e) ->
    $(@).children('.submit').toggle()
    if($(@).children('textarea').attr('readonly'))
      $(@).children('textarea').removeAttr('readonly')
    else
      $(@).children('textarea').attr('readonly','')
  )

  $('body').on('ajax:success', 'form.destroy', (e, data, status) ->
    console.log(data)
    target_id = data.delete
    console.log(target_id)
    $('#'+target_id).remove()
  )

  $('body').on('ajax:success', 'form.update', (e, data, status) ->
    target_id = '#note-' + data.id
    $(target_id+'>.description').text = data.description
  )

  $('form#new_note').on('ajax:success', (e, data, status) ->
    console.log(data)
    $('#note_title').val('')
    authenticity_token=
    note = """
    <div class="well" id="note-#{data.id}">
      <div class="title">
        #{data.title}
      </div>
      <form class="update" action="/notes/#{data.id}" method="POST" data-remote="true">
        <input type="hidden" name="_method" value="PATCH">
        <textarea name="description" cols="30" rows="10" class="description" readonly="readonly">
        </textarea>
        <input type="submit" value="Edit" class="submit" style="display: none;">
      </form>
      <form class="destroy" action="/notes/#{data.id}" data-remote="true" method="POST">
        <input type="hidden" name="_method" value="DELETE">
        <input type="submit" value="Delete">
      </form>
    </div>
    """
    console.log(note)
    $('#note_list').append(note)
  )



