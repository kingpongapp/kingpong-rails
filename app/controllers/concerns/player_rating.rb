module PlayerRating
  def get_rating
    # The winner is a FIFO
    parse_response = []
    player01 = 0
    player02 = 0
    
    players = PlayerGame.where(game_id: params[:game_id])
    
    players.each do |player|
      if player.player_id == session[:player_id]
        player01 = Player.find(session[:player_id])
      else 
        player02 = Player.find(player.player_id)
      end
    end

    match = EloRating::Match.new
    match.add_player(rating: player01.score, winner: true)
    match.add_player(rating: player02.score)
    parse_response = match.updated_ratings
  end
end
