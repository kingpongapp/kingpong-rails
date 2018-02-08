class GamesController < ApplicationController
  include PlayerRating

  def index
    @games = Game.includes(:players)
  end

  def create
    players = []
    Player.all.each do |player|
      players.push(player.id)
    end

    draw = RoundRobinTournament.schedule(players)

    draw.each do |round|
      gm = Game.new
      gm.save

      idx = 0
      round.each do |game|
        playergame = PlayerGame.new
        playergame.player_id = game[idx]
        playergame.game_id = gm.id
         if playergame.save
         else
          # Error Handling
         end
        idx =+ 1
      end 
    end   
    redirect_to action:"index" 
  end

  def show
    
  end

  def update
    # Update: Winner info
    playergame = PlayerGame.where(["game_id = ? and player_id = ?", params[:game_id], session[:player_id]])
    playergame.first.win = true
    
    parse_response = get_rating
    playergame.first.score = parse_response[0]
    if playergame.first.save  
    else
      # Error Handling
    end
   
    
    # Update: Loser info
    playergame = PlayerGame.where(["game_id = ? and player_id != ?", params[:game_id], session[:player_id]])
    playergame.first.win = false
    playergame.first.score = parse_response[1]
    if playergame.first.save  
    else
      # Error Handling
    end
  end
end
