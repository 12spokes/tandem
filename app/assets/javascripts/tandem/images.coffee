# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
#= require tandem/current_image
#= require tandem/gallery_image

$(document).ready ->
  $("#new_tandem_iamge input[type=file][name='image[resource]']").fileupload
    dataType: 'json'
    url: $(this).closest('form').attr('action')
    done: (e, data) ->
      $('#tandem_image_gallery ul').prepend(window.JST['tandem/gallery_image'](data.result))
      $('div#current-image').replaceWith(window.JST['tandem/current_image'](data.result))

  $('section#tandem_image_gallery ul').click (event) ->
    image = $(event.target)

    if image.is('img')
      $('div#current-image').replaceWith(window.JST['tandem/current_image'](image.data()))

