Rails.application.routes.draw do
  resources :games
  resources :player_games
  resources :players

  get '/', to: 'pages#index'

  post '/session', to: 'sessions#create'

  delete '/session', to: 'sessions#destroy'

  get '/pages', to: 'pages#home'

  get '/api/players', to: 'players#api_rating'

  put '/api/players', to: 'players#api_update'

  get '/api/players/:id', to: 'players#api_show'

end
