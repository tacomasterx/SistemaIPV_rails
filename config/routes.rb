Rails.application.routes.draw do
  #get 'transactions/create', to: "transactions#create"
  #get 'transactions/update', to: "transactions#update"
  resources :sales do
    #POST "sales/concrete", to: "sales#concrete"
  end
  resources :inventory_items
  resources :employees
  resources :shops
  resources :product_statuses
  resources :products
  resources :product_types
  # servidores:
  # rails server
  # ruby .\bin\webpack-dev-server
  devise_for :users


  get 'home/index', to: "home#index"
  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
## TODO: Crear Modelo para dar permisos y su respectivo controlador y vistas.
