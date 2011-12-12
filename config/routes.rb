Tandem::Engine.routes.draw do
  resources :pages do
    resources :contents, :only => [:edit, :update]
    collection { get 'home' }
  end

  root :to => 'pages#home'
end
