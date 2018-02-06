Rails.application.routes.draw do
  resources :games
  resources :player_games
  resources :players

  get '/', to: 'sessions#home'

  post '/session', to: 'sessions#create'

  delete '/session', to: 'sessions#destroy'
end
