// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

bind_tandem_events = function(container) {
  container.find('.tandem_content').hover(
      function () {
        id = this.id
        $('#tandem_toolbar_'+id).slideDown('slow')
      },function () {
        id = this.id
        $('#tandem_toolbar_'+id).slideUp('slow')
      }
  )
  container.find('.tandem_edit_link').colorbox({iframe:true, width:"80%", height:"80%"})
}

reload_tandem_content = function(resource_id,resource_url) {
  $.fn.colorbox.close()
  resource_id = '#'+resource_id
  $(resource_id).load(resource_url+' '+resource_id, function() {
    bind_tandem_events($(resource_id))
  })
}

$().ready(function () {
  $('.page_link').colorbox({iframe:true, width:"80%", height:"80%", onCleanup: function() {
           location.reload();
  }})
  bind_tandem_events($('body'))
})


