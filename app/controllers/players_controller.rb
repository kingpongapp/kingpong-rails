class PlayersController < ApplicationController
		def create
		player = Player.new
		player.email = params[:email]
		player.password = params[:password]
		player.name = params[:name]
		player.nickname = params[:nickname]
		player.image_url = params[:image]
		player.save

		redirect_to '/'
	end
end
