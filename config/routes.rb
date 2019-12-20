Rails.application.routes.draw do
  devise_for :users
  root 'static#index'
  
  resources :games, only: [:new, :create, :show]
end
