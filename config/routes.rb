Rails.application.routes.draw do
  root 'static#index'

  get '/auth/facebook', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', as: :logout, to: 'sessions#destroy'

  get '/profile', to: 'users#show'

  get 'static_place', to: 'static#place'
  get '/autocomplete', to: 'google/autocomplete#index'

  get "places/:slug", as: 'place', to: 'places#show'
  resources 'places', only: [:create]

  post '/follow', to: 'user_follows#create'
end
