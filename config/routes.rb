Rails.application.routes.draw do
  resources :order_items
  get 'cart', to: 'cart#show'
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'cart/show'
  resources :product_listings
  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'pages/index'
  get '/admin', to: 'pages#admin', as: 'admin'
  get '/pages/profile', to: 'pages#profile', as: 'profile'
  get 'pages/about', to: 'pages#about', as: 'about'
  get 'pages/contact', to: 'pages#contact', as: 'contact'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
