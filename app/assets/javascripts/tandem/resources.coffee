$(document).ready ->
  $('.tandem_new_resource').colorbox()
  $('.tandem_edit_resource').colorbox()

  # TODO - Consider abstracting this in a way that it can be used
  # both for tandem_content and tandem_resources
  $('tr.tandem_resource').on
    'mouseenter': ->
      $('div.tandem_toolbar', $(this)).fadeIn('slow')

    'mouseleave': ->
      $('div.tandem_toolbar', $(this)).fadeOut('slow')

    'click': (event) ->
      if event.target.tagName != 'A'
        $.fn.colorbox
          href: $('a.tandem_edit_resource', $(this)).attr('href')
        return false
