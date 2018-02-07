Rails.application.routes.draw do
  resources :games
  resources :player_games
  resources :players

  get '/', to: 'pages#index'

  get '/session', to: 'pages#show'

  post '/session', to: 'sessions#create'

  delete '/session', to: 'sessions#destroy'

  get '/pages', to: 'pages#show'

end
