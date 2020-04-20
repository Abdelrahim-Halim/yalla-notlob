Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
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
