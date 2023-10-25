Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"

  resources :inventory

  get '/inventory/search', to: 'inventory#search', as: 'inventory_search'


  resources :inventories

  resources :home
  get "home" => "home#index"

  resources :users
  get "sign_up" => "users#new"

  root "sessions#new"

  # Defines the root path route ("/")
  # root "posts#index"
end
