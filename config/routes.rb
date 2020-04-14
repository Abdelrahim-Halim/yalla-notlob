Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :order
||||||| merged common ancestors
  get 'home/index'
  root 'home#index'
=======
  get 'home/index', to:'home#index'
  root to: 'home#index'
>>>>>>> create addNewFriend function
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/add_friend/:id' to: 'home#addFriend'
  get 'home/add_friend', to: 'home#addFriend'
  get 'home/add_group', to: 'home#addGroup'

end
