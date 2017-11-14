Rails.application.routes.draw do

  root 'static#welcome'
  get 'static/welcome'


  resources :babysitters do
    resources :reviews
  end

end
