Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
||||||| merged common ancestors
<<<<<<< HEAD
  get 'home/index', to:'home#index'
  root to: 'home#index'
=======
=======
>>>>>>> create friendships controller
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :order
<<<<<<< HEAD
||||||| merged common ancestors
  get 'home/index'
  root 'home#index'
=======
  get 'home/index', to:'home#index'
  root to: 'home#index'
>>>>>>> create addNewFriend function
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
||||||| merged common ancestors
>>>>>>> a0a465e94fbc396726a6d0ad9b9346bf785f2ee1
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
 
>>>>>>> create friendships controller
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
