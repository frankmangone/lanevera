Rails.application.routes.draw do
  # The priority is based upon order of creation.

  root 'static#home'
  
  get 'info' => 'static#info'
  get 'signup' => 'users#new'

  resources :categories
  resources :products
end
