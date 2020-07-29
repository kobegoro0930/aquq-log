Rails.application.routes.draw do
  root "top#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :show, :create, :edit, :update]
end
