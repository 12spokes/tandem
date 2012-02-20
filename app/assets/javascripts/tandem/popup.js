// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
//= require jquery
//= require tandem/wymeditor/jquery.wymeditor.min
//= require tandem/images
//= require tandem/vendor/jquery.ui.widget
//= require tandem/vendor/jquery-fileupload/jquery.iframe-transport.js
//= require tandem/vendor/jquery-fileupload/jquery.fileupload.js

$().ready(function () {
  if($('#success_data').length != 0) {
    resource_id = $('#success_data').attr('resource_id')
    resource_url = $('#success_data').attr('resource_url')
    if(typeof(resource_id)=='undefined') {
      parent.location = resource_url
    } else {
      parent.reload_tandem_content(resource_id,resource_url)
    }
  }

  $('.wymeditor').wymeditor({
  });
})

update_image_selection = function(id) {
  $('#content_image_image_id').val(id);
  update_current_image();
}

update_image_gallery = function() {
  $('#left_image_panel iframe').attr("src", $('#left_image_panel iframe').attr("src"));
}

update_current_image = function() {
  $('#selected_image_viewpane').load($('#selected_image_viewpane').attr('src').replace(':id:',$('#content_image_image_id').val()))
}

$(document).ready (function() {
  $('h3.settings-toggle').live('click', function () {
    $('div.advanced-settings').slideToggle('slow');
  });
});
