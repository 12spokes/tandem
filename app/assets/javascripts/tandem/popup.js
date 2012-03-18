// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$().ready(function () {
  $('form.tandem_content_editor').on('ajax:success', function(event, content, status, jqXHR){
    $.get(parent.location.href, function(data, status, jqXHR){
      var content_id = '#' + content.tag;

      $(content_id, parent.document).html( $(content_id, data).html() );
      parent.$.fn.colorbox.close();
    });
  });

  $('.wymeditor').wymeditor({ wymPath: '/assets/tandem/wymeditor/' });

  $('h3.settings-toggle').live('click', function () {
    $('div.advanced-settings').slideToggle('slow');
  });
});
