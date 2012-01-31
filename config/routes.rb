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

    resources :contents, :only => [:edit, :update]
  end

  root :to => 'pages#home'
end
