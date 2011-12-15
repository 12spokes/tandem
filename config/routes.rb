Tandem::Engine.routes.draw do
  resources :images

  resources :pages do
    resources :contents, :only => [:edit, :update]
    collection { get 'home' }
  end

  root :to => 'pages#home'
end
