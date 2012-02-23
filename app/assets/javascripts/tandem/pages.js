// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

bind_tandem_events = function(container) {
  container.find('.tandem_content').hover(
      function () {
        id = this.id
        $('#tandem_toolbar_'+id).fadeIn('slow')
      },function () {
        id = this.id
        $('#tandem_toolbar_'+id).fadeOut('slow')
      }
  )
  container.find('.tandem_edit_link').colorbox({iframe:true, width:"95%", height:"90%"})
}

reload_tandem_content = function(resource_id,resource_url) {
  $.fn.colorbox.close()
  resource_id = '#'+resource_id
  $(resource_id).load(resource_url+' '+resource_id, function() {
    bind_tandem_events($(resource_id))
  })
}

$().ready(function () {
  $('.page_link').colorbox({onCleanup: function() {
           location.reload();
  }});

  bind_tandem_events($('body'));

  if( $('#tandem_page_links').length > 0 ){
    $('body').addClass('tandem-admin-bar');
  }
  
})


