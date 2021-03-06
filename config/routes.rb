Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index, :show, :new, :create, :edit, :update]
  resources :order_items, only: [:create]
  resources :carts, only: [:show, :create, :index]
  resources :payments, only: [:new, :create, :index]

  get '/show_current_cart', to: 'carts#show_current_cart', as: 'show_current_cart'

  get '/payment_completed', to: 'payments#payment_completed', as: 'payment_completed'
  resources :users, only: [:new, :create] do
    member do
      get '/dashboard', to: 'users#dashboard'
    end
  end

  get 'ui(/:action)', controller: 'ui'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
