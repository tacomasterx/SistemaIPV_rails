Rails.application.routes.draw do
  #get 'transactions/create', to: "transactions#create"
  #get 'transactions/update', to: "transactions#update"
  resources :sales
    #patch "sales/concrete", to: "sales#concrete"

  resources :inventory_items
  resources :employees
  resources :shops
  resources :product_statuses
  resources :products
  resources :product_types

  get "product_types/:product_types_id/clone", to: "product_types#clone"
  # servidores:
  # rails server
  # ruby .\bin\webpack-dev-server
  devise_for :users

  post "payment_details/create", to: "payment_details#create"

  ##Revenue
  get "revenue/", to: "revenue#index"

  ##Home
  get 'home/index', to: "home#index"
  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
## TODO: Crear Modelo para dar permisos y su respectivo controlador y vistas.
