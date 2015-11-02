Rails.application.routes.draw do
  # The priority is based upon order of creation.

  root 'static#home'

  get 'info' => 'static#info'

  # Shopping Cart
  match 'carts/:id', to: 'carts#show', as: 'cart', via: 'get'
  get 'purchases'   => 'carts#index'
  get 'add_item'    => 'carts#add_item'
  get 'remove_item' => 'carts#remove_item'

  # Users
  devise_for :users, controllers: { 
    registrations: "users/registrations",
    sessions:      "users/sessions"  
  }
  resources :users

  # Locations
  resources :locations,  exclude: [:index, :show]

  # Categories
  resources :categories, exclude: [:index, :show]

  # Products
  resources :products,   exclude: :show

  # Photos
  resources :photos,     exclude: [:index, :show]

  # Offers
  resources :offers,     exclude: :show
end
