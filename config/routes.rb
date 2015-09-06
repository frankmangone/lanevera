Rails.application.routes.draw do
  # The priority is based upon order of creation.

  root 'static#home'
  
  get 'info' => 'static#info'

  # Users
  devise_for :users, controllers: { 
    registrations: "users/registrations" 
  }

  resources  :users

  # Categories
  resources :categories

  # Products
  resources :products
end
