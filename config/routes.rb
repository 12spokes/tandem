Tandem::Engine.routes.draw do
  resources :images do
    member do
      get :thumb
    end
  end

  resources :pages do
    collection do
      get :home
    end
  end

  resources :contents, :only => [:edit, :update]

  root :to => 'pages#home'
end
