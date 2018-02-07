class SessionsController < ApplicationController
  def home; end

  def create
    player = Player.find_by(email: params[:email])
    if player && player.authenticate(params[:password])
      session[:player_id] = player.id
      redirect_to '/'
    else
      redirect_to '/games'
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to '/'
  end
end
