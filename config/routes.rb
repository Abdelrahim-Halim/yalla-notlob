Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :order
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
