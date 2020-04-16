Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :order
 
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
end
