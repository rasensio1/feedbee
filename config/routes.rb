Rails.application.routes.draw do
  root 'static#index'
  get '/auth/facebook', as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
end
