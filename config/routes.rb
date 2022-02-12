Rails.application.routes.draw do

  resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'
   
   
      delete '/logout' => 'sessions#destroy'
 

  root "products#index"
     resources :products do
     resources :comments
  end

  resources :carts do
      post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  end
  resources :likes, only:[:create,:destroy]
resources :shops
  end
