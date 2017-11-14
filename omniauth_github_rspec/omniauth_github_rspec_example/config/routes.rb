Rails.application.routes.draw do
  root 'users#new'
  get 'users/new'

  # omniauth routes
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/github', as: 'github_login'

  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
