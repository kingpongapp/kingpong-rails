class SessionsController < ApplicationController

	def home

	end

	def create
		player = Player.new
		player.email = params[:email]
		player.password = params[:password]
		player.save

		redirect_to '/'
	end
end
