class SessionsController < ApplicationController

	def home
	end

	def create
    player = Player.find_by(email: params[:email])
    if player && player.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :home
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

end
