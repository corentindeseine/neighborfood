Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cookers, only: %i[index show] do
    resources :meals, only: %i[new create show]
    resources :orders, only: %i[create update]
  end
    resources :orders, only: %i[show index destroy]
end
