Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  get 'welcome/index'

  get '/contact' => "contact#new"
  post '/contact' => "contact#create"

  get '/about' => "welcome#about"

  # get '/products' => "products#index"
  # get '/products/:id' => "products#show"
  resources :products, only: [:index, :show]
  
  root 'welcome#index'

  resource :cart, only: [:show]
  post '/cart/checkout' => "carts#checkout"
  resources :order_items, only: [:create, :update, :destroy]

  namespace :admin do
    resources :slides
  end
end
