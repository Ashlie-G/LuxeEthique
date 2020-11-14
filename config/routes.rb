Rails.application.routes.draw do

  resources :product_listings
  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'pages/index'
  get '/admin', to: 'pages#admin', as: 'admin'
  get '/pages/profile', to: 'pages#profile', as: 'profile'
  get 'pages/about', to: 'pages#about', as: 'about'
  get 'pages/contact', to: 'pages#contact', as: 'contact'
  post '/product_listings/:id/buy', to: 'product_listings#buy', as: 'buy'
  get '/product_listings/payments/success', to: 'payments#success', as: 'success'

  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
