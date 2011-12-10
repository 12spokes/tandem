Tandem::Engine.routes.draw do
  resources :pages do
    resources :contents
    collection do
      get 'home'
    end
  end

  root :to => 'pages#index'
end
