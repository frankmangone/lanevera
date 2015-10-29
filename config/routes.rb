Rails.application.routes.draw do
  # The priority is based upon order of creation.

  root 'static#home'

  get 'info' => 'static#info'

  # Shopping Cart
  get 'cart'        => 'carts#show'
  get 'add_item'    => 'carts#add_item'
  get 'remove_item' => 'carts#remove_item'

  # Users
  devise_for :users, controllers: { 
    registrations: "users/registrations",
    sessions:      "users/sessions"  
  }
  resources :users

  # Locations
  resources :locations, exclude: [:index, :show]

  # Categories
  resources :categories

  # Products
  resources :products

  # Photos
  resources :photos,    exclude: [:index, :show]

  # Offers
  resources :offers,    exclude: :show
end
