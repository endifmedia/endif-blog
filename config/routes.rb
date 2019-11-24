Rails.application.routes.draw do
  root 'posts#index'
  resources :posts

  get '/signup' => 'users#new'
  resources :users, except: [:new]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :categories, except: [:destroy]
end
