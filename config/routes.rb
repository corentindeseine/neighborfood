Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cookers, only: %i[index show] do
    resources :meals, only: %i[new show], as: :test
    resources :orders, only: %i[create update]
    resources :reviews, only: :create
  end
    resources :orders, only: %i[show index destroy]
end
