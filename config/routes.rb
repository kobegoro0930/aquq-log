Rails.application.routes.draw do
  
  root "top#index"

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  resources :users, only: [:show] do
    member do
      get 'liked'
    end
  end
  
  resources :groups do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :wents, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :scores, only: [:index]

  resources :areas do
    collection do
      get 'tokyo'
      get 'kanagawa'
      get 'chiba'
      get 'ibaraki'
      get 'saitama'
      get 'tochigi'
    end
  end
end
