Rails.application.routes.draw do
  # The priority is based upon order of creation.

  root 'static#home'
  
  get 'info' => 'static#info'
  get 'signup' => 'users#new'

  # Users
  devise_for :users

  # Categories
  resources :categories

  # Products
  resources :products
end
