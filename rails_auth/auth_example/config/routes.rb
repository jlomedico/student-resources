Rails.application.routes.draw do
  root 'page#index'

  get 'secret' => 'page#secret'

  get 'register' => 'users#new'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
