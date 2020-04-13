Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :order
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/add_friend/:id' to: 'home#addFriend'
  get 'home/add_friend', to: 'home#addFriend'
  get '/home/add_group', to: 'home#addGroup'

end
