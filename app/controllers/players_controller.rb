class PlayersController < ApplicationController
	def create
		player = Player.new
		player.email = params[:email]
		player.password = params[:password]
		player.name = params[:name]
		@nickname = params[:nickname]
		player.image_url = params[:image]
		player.save
		render :welcome
	end

end

	# def show
		# player = Player.find_by(name: )
		# @nickname = player.nickname
		# render :welcome
	# end
	# require 'twitter'
	
	# client = Twitter::REST::Client.new do |config|
		# config.consumer_key        = "oVJZUyR4pRgP5u78piwEzXTi8"
		# config.consumer_secret     = "AOHeeWOY5wNfoq1y6VuzCUoPDbOREfk0UGRZHIjPx7hFTX4atV"
		# config.access_token        = "960740313882009600-K9rIEKzC5O5sw3g1kH8PYZnjMeFFx48"
		# config.access_token_secret = "oypKXUpp79RUgrH0MVtwXejfPQwqtXtCj7y9XxjrSkQbd"
	# end	
