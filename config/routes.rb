Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :order
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/add_friend/:id' to: 'home#addFriend'
  # get 'add_friend', to: 'home#addFriend'
  # post 'home/new_friend', to: 'home#newFriend'
  # delete 'remove_friend/:id',to: 'home#unfriend'
  resources :friendships
  # root 'friends#index'
  post '/friendships/create', to: 'friendships#create'

  resources :groups
  # resources :groups do
  #   resource :users, only: [:create, :destroy]
  # end

  post '/groups/:id', to: 'groups#addFriendToGroup'
  delete '/groups/:gid/:uid', to: 'groups#removeFriendFromGroup',as: 'remove_friend'

  # get 'add_group/:id', to: 'groups#addGroup',as: 'group'
end
