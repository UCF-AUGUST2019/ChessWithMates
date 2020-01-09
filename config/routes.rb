Rails.application.routes.draw do
  devise_for :users
  root 'static#index'
  
  resources :games, only: [:index, :new, :create, :update, :show]
end
