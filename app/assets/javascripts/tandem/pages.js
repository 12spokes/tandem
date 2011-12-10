// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$().ready(function () {
  $('.tandem_content').hover(
      function () {
        id = this.id
        $('#tandem_toolbar_'+id).slideDown('slow')
      },function () {
        id = this.id
        $('#tandem_toolbar_'+id).slideUp('slow')
      }
  )
  $('.tandem_edit_link').colorbox({iframe:true, width:"80%", height:"80%"})
  $('.page_link').colorbox({iframe:true, width:"80%", height:"80%"})
})