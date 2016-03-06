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
  resources :order_items, only: [:create, :update, :destroy]
end
