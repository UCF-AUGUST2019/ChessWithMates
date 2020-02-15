Rails.application.routes.draw do
  devise_for :users
  root 'static#index'
  
  resource :dashboard, only: [:show]
  resources :games, only: [:index, :new, :create, :update, :show, :destroy] do
    resources :pieces, only: [:create, :show, :update]
  end
  resources :games do
    member do
        put :concede
      end
  end

end
