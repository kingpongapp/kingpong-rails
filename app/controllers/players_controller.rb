class PlayersController < ApplicationController
  include PlayerRating

	def create
		player = Player.new
		player.email = params[:email]
		player.password = params[:password]
		player.name = params[:name]
		player.nickname = params[:nickname]
		@nickname = params[:nickname]
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
    parse_response = get_rating

    render json: {info: parse_response}
  end

end
