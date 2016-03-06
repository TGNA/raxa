Rails.application.routes.draw do

  get 'welcome/index'

  get '/contact' => "contact#new"
  post '/contact' => "contact#create"

  get '/about' => "welcome#about"

  get '/products' => "product#index"
  get '/products/:id' => "product#show"
  
  root 'welcome#index'

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
