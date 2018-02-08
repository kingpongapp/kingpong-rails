module PlayerRating
  def get_rating
    # The winner is a FIFO
    parse_response = []
    players = PlayerGame.where(game_id: params[:game_id])

    players.each do |player|
      if player.id == session[:user_id]
        player01 = session[:user_id]
      else 
        player02 = player.id 
      end
    end

    

    match = EloRating::Match.new
    match.add_player(rating: player01.score, winner: true)
    match.add_player(rating: player02.score)
    parse_response = match.updated_ratings
  end
end
