Rails.application.routes.draw do
  resources :order_items
  get 'orders/:id/items', to: 'order_items#index', as: 'order_details' 
  post 'items', to: 'order_items#create', as: 'add_item'
  delete 'items/:id', to: 'order_items#destroy', as: 'destroy_item'

  # get 'item/:id', to: 'order_items#destroy', as: 'destroy_item'
  
  devise_for :users
  get 'home/index'

  get 'order/seen'
  root 'home#index'
  get 'order/show'
  post 'order/:id/finish_order', to: 'order#finish', as: 'finish_order'
  resources :order

  resources :friendships

  post '/friendships/create', to: 'friendships#create'

  resources :groups


  post '/groups/:id', to: 'groups#addFriendToGroup'
  delete '/groups/:gid/:uid', to: 'groups#removeFriendFromGroup',as: 'remove_friend'

end
