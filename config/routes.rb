Rails.application.routes.draw do
  root "top#index"
  devise_for :users

  resources :users, only: [:edit, :update]
  
  resources :groups do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :scores, only: [:index]
end
