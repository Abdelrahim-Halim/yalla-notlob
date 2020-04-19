Rails.application.routes.draw do
  resources :order_items
  get 'orders/:id/items', to: 'order_items#index', as: 'order_details' 
  post 'items', to: 'order_items#create', as: 'add_item'
  delete 'items/:id', to: 'order_items#destroy', as: 'destroy_item'

  # get 'item/:id', to: 'order_items#destroy', as: 'destroy_item'
  
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :order
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
