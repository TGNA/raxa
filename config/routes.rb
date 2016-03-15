Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  get 'welcome/index'

  get '/contact' => "contact#new"
  post '/contact' => "contact#create"

  get '/about' => "welcome#about"

  resources :products, only: [:index, :show]
  
  root 'welcome#index'

  resource :cart, only: [:show]
  post '/cart/checkout' => "carts#checkout"
  resources :order_items, only: [:create, :update, :destroy]

  namespace :admin do
    root 'sliders#index'
    resources :sliders, except: [:show]

    get '/text' => "file_reader#text"
    post '/text' => "file_reader#text_process"
  end
end
