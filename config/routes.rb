Rails.application.routes.draw do
  root "top#index"
  devise_for :users

  resources :users, only: [:edit, :update]
  
  resources :groups do
    resources :comments, only: :create
  end

  resources :scores, only: [:index]
end
