# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

$(document).ready ->
  $("#new_tandem_iamge input[type=file][name='image[resource]']").fileupload
    dataType: 'json'
    url: $(this).closest('form').attr('action')
    done: (e, data) ->
      $('#tandem_image_gallery ul').prepend("<li><image src=\"#{ data.result.thumb_url }\" data-id=\"#{ data.result.id }\"/></li>")
      $('div#selected_image_viewpane img').attr('src', data.result.thumb_url)
      $('input#content_image_image_id').val(data.result.id)

  $('section#tandem_image_gallery ul').click (event) ->
    image = $(event.target)

    if image.is('img')
      $('div#selected_image_viewpane img').attr('src', image.attr('src'))
      $('input#content_image_image_id').val(image.data('id'))

