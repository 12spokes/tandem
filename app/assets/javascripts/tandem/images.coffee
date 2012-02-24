# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
#= require tandem/current_image
#= require tandem/gallery_image

$(document).ready ->
  $("#new_tandem_image input[type=file][name='image[resource]']").fileupload
    dataType: 'json'
    url: $(this).closest('form').attr('action')
    
    done: (e, data) ->
      $('#tandem_image_gallery ul').prepend(window.JST['tandem/gallery_image'](data.result))
      $('div#current-image').replaceWith(window.JST['tandem/current_image'](data.result))

    progress: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10) + '%'
      $('div#tandem-upload-image div.loader div.range').css({width: progress})
      $('div#tandem-upload-image div.loader div.range span').text(progress)

    start: (e, data) ->
      $('div#tandem-upload-image div.loader').show()

    always: (e, data) ->
      $('div#tandem-upload-image div.loader').hide()

  $('section#tandem_image_gallery ul').click (event) ->
    image = $(event.target)

    if image.is('img')
      $('div#current-image').replaceWith(window.JST['tandem/current_image'](image.data()))

