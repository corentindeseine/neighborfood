Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profil', to: 'profils#profil'
  get '/about', to: 'pages#about'
  resources :cookers, only: %i[index show] do
    resources :meals, only: %i[show]
    resources :orders, only: %i[create update]
    resources :reviews, only: :create
    resources :order_details, only: %i[create]
  end
  resources :chatrooms, only: [:create, :show, :index] do
    resources :messages, only: :create
  end
  resources :order_details, only: %i[destroy update]
  resources :orders, only: %i[show index destroy update] do
    collection do
      get :cart
    end
  end
  resources :meals, only: %i[new create edit update destroy]
end
