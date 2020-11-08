Rails.application.routes.draw do
  resources :product_listings
  devise_for :users
  get 'pages/index'
  get '/admin', to: 'product_listings#admin', as: 'admin'
  get '/pages/profile', to: 'pages#profile', as: 'profile'
  get 'pages/about', to: 'pages#about', as: 'about'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
