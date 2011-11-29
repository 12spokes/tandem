Rails.application.routes.draw do

  devise_for :users

  mount Tandem::Engine => "/tandem"
end
