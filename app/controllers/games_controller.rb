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

    # Generation of Round Robin draw
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

    if params[:winner] == "winner"
      # Update: Completed game
      game = Game.find(params[:id])
      game.completed = true;
      if game.save
      else
        # Error Handling
      end

      # Update: Winner info
      playergame = PlayerGame.where(["game_id = ? and player_id = ?", params[:id], session[:player_id]])
      playergame.first.win = true
      
      parse_response = get_rating
      player = Player.find(session[:player_id])
      player.score = parse_response[0]

      if player.save and playergame.first.save
      else
        # Error Handling
      end
    
      # Update: Loser info
      playergame = PlayerGame.where(["game_id = ? and player_id != ?", params[:id], session[:player_id]])
      playergame.first.win = false

      player = Player.find(playergame.first.player_id)
      player.score = parse_response[1]
      if player.save and playergame.first.save  
      else
        # Error Handling
      end

      redirect_to action:"index"
    end


    if params[:acceptance] == "true"

      # Validation: A player can only accept their own game
      if params[:player_id].to_i == session[:player_id]

        playergame = PlayerGame.where(["game_id = ? and player_id = ?", params[:id], session[:player_id]]).first
        playergame.accepted = true
        if playergame.save
          redirect_to action:"show"
        else
        end
      else
        # Error handling
      end

    elsif params[:acceptance] == "false"

      # Validation: A player can only decline their own game
      if params[:player_id].to_i == session[:player_id]
        playergame = PlayerGame.where(["game_id = ? and player_id = ?", params[:id], session[:player_id]]).first
        playergame.accepted = false
        playergame.save

        # Trigger automatic win to opponent if opponent has accepted
        playergame_opp = PlayerGame.where(["game_id = ? and player_id != ?", params[:id], session[:player_id]]).first 
        if playergame_opp.accepted == true
          playergame_opp.win = true;
          playergame.win = false;
          playergame.save
          playergame_opp.save
        elsif playergame_opp.accepted == "false"
          playergame_opp.win = true;
          playergame.win = false;
          playergame.save
          playergame_opp.save
        end
        redirect_to action:"show"
      else
        # Error handling
      end
    end

  end
end
