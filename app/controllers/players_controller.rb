class PlayersController < ApplicationController
	def create
		player = Player.new
		player.email = params[:email]
		player.password = params[:password]
		player.name = params[:name]
		@nickname = params[:nickname]
		player.image_url = params[:image]
		player.score = 100
		player.save		
		render :welcome
	end

	def index
		@players = Player.all
	end

	def show

		@player = Player.find(params[:id])
		@player_rank = Player.order('score DESC').index(@player) + 1
  end

  def api_rating
    render json: {info: 'receive rating'}
  end

end
