// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

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
})