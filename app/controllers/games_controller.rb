class GamesController < ApplicationController

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

    playergame = PlayerGame.where(["game_id = ? and player_id = ?", params[:game_id], session[:player_id]])
    playergame.win = true

    if playergame.save

    else
      # Error Handling
    end
  end
end
