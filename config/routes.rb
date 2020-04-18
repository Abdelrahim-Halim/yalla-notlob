Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'order/show'
  post 'order/:id/finish_order', to: 'order#finish', as: 'finish_order'
  resources :order
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
