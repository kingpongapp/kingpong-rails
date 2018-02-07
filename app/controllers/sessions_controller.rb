class SessionsController < ApplicationController

  def create
    player = Player.find_by(email: params[:email])
    if player && player.authenticate(params[:password])
      session[:player_id] = player.id
      redirect_to '/pages'
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:player_id] = nil
    redirect_to '/'
  end
end
