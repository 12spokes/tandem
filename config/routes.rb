Tandem::Engine.routes.draw do
  resources :images

  resources :pages do
    resources :contents, :only => [:edit, :update]
  end

  root :to => 'pages#home'
end
