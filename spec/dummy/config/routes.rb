Rails.application.routes.draw do

  devise_for :users

  mount Tandem::Engine => "/tandem"

  match '/custom_route' => 'pages#index', :as => 'custom'
end
