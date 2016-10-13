
Rails.application.routes.draw do
  
  get '/signin' => 'users#signin'
  post '/signin' => 'sessions#create'
  get 'sessions/create'
  get 'sessions/destroy'
  post '/rides' => 'rides#create'
  resources :users, only: [:show, :create, :new]
  root 'users#index'

resources :attractions
end