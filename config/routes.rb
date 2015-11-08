Rails.application.routes.draw do
  root 'static#index'

  get '/auth/facebook', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', as: :logout, to: 'sessions#destroy'

  get 'place', to: 'static#place'
end
