Rails.application.routes.draw do
  # The priority is based upon order of creation.

  root 'static#home'

  # Static
  get 'info' => 'static#info'
  get 'contact' => 'static#contact'

  # Pop Ups
  get 'pop_up' => 'pop_ups#pop_up'

  # Shopping Cart
  get 'purchases'   => 'carts#index'
  get 'add_item'    => 'carts#add_item'
  get 'remove_item' => 'carts#remove_item'
  match 'carts/:id',    to: 'carts#show',     as: 'cart',     via: 'get'
  match 'purchase/:id', to: 'carts#purchase', as: 'purchase', via: 'get'
  match 'carts/:id/confirm',   to: 'carts#confirm',        as: 'confirm_cart',        via: 'post'
  match 'carts/:id/delivered', to: 'carts#mark_delivered', as: 'mark_delivered_cart', via: 'post'

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
