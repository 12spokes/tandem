Tandem::Engine.routes.draw do
  resources :pages do
    resources :contents
  end
end
