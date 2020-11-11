Rails.application.routes.draw do

  resources :product_listings
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :order_items
  get 'cart', to: 'cart#show'
  post '/cart/:id/buy', to: 'cart#buy', as: 'buy'
  get '/cart/:id/success', to: 'cart#success', as: 'success'
  get '/cart/:id/cancel', to: 'cart#cancel', as: 'cancel'
  get 'pages/index'
  get '/admin', to: 'pages#admin', as: 'admin'
  get '/pages/profile', to: 'pages#profile', as: 'profile'
  get 'pages/about', to: 'pages#about', as: 'about'
  get 'pages/contact', to: 'pages#contact', as: 'contact'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
