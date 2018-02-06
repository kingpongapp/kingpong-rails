Rails.application.routes.draw do
  resources :games
  resources :player_games
  resources :players

  get '/', to: 'session#home'

  post '/session', to: 'session#create'


  delete '/session', to: 'session#destroy'
end
