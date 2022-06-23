Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cookers, only: %i[index show] do
    resources :meals, only: %i[new show], as: :test
    resources :orders, only: %i[create update]
    resources :reviews, only: :create
    resources :order_details, only: %i[create update]
  end
  resources :chatrooms, only: [:create, :show, :index] do
    resources :messages, only: :create
  end
  resources :order_details, only: %i[destroy]
  resources :orders, only: %i[show index destroy update]
end
