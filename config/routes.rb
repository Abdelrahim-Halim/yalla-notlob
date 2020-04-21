Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  get 'order/seen'
  root 'home#index'
  resources :order

  resources :friendships

  post '/friendships/create', to: 'friendships#create'

  resources :groups


  post '/groups/:id', to: 'groups#addFriendToGroup'
  delete '/groups/:gid/:uid', to: 'groups#removeFriendFromGroup',as: 'remove_friend'

end
