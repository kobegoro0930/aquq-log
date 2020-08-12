Rails.application.routes.draw do

  root "top#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  resources :users, only: [:show]
  
  resources :groups do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :scores, only: [:index]
end
