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
  end

  def api_rating
    parse_response = []
    player01 = Player.find(params[:player_1])
    player02 = Player.find(params[:player_2])

    match = EloRating::Match.new
    match.add_player(rating: player01.score, winner: true)
    match.add_player(rating: player02.score)
    parse_response = match.updated_ratings

    render json: {info: parse_response}
  end

end
