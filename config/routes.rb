Rails.application.routes.draw do
  root 'static#index'

  get '/auth/facebook', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', as: :logout, to: 'sessions#destroy'

  get '/profile', to: 'users#show'

  get 'static_place', to: 'static#place'
  get '/autocomplete', to: 'google/autocomplete#index'
  get '/map', to: 'static#map'

  get "places/:slug", as: 'place', to: 'places#show'
  resources 'places', only: [:create]

  resources 'comments', only: [:create, :index]

  post '/follow', to: 'user_follows#create'
  get '/follow', to: 'user_follows#show'
  delete '/follow', to: 'user_follows#destroy'

  resources 'votes', only: [:create]
end
