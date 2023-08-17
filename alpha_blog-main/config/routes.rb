Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  #devise_for :users 
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root'pages#home'
  get 'about', to: 'pages#about'
  resources :articles

  
  #get 'signup', to: 'users#new'
  #resources :users, except: [:new]
  #get 'login', to: 'sessions#new'
  #post 'login', to: 'sessions#create'
  #get 'logout', to: 'device/sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
