Rails.application.routes.draw do
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
