Rails.application.routes.draw do
  devise_for :users
  root to: "registration#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :carts, only: [:create, :index, :destroy]
  post 'buy', to: 'carts#buy'

  resources :purchases, only: [:show, :index]

  resources :all_products
  get 'all_products/index'

  resources :products
  get 'products/index'
  get 'products/detail'
  get 'products/all'
  get 'products/show'
  get 'products/new'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'

  authenticate :user do
    resources :products
  end

end
