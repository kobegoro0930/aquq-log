Rails.application.routes.draw do
  root "top#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create]
end
