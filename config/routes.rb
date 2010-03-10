ActionController::Routing::Routes.draw do |map|
  map.resources :tandem_pages do |tandem_page|
    tandem_page.resources :tandem_contents
  end
  
  map.resources :tandem_texts
end