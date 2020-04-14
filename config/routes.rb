Rails.application.routes.draw do
<<<<<<< HEAD
  get 'home/index', to:'home#index'
  root to: 'home#index'
=======
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :order
>>>>>>> a0a465e94fbc396726a6d0ad9b9346bf785f2ee1
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/add_friend/:id' to: 'home#addFriend'
  get 'home/add_friend', to: 'home#addFriend'
  get 'home/add_group', to: 'home#addGroup'

end
