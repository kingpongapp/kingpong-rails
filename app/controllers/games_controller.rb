class GamesController < ApplicationController

  def index
    @player = Player.includes(:PlayerGame)
    @player_games = PlayerGame.all
    @games = Game.all
    

    if @player_games
    end

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
          binding.pry
         end
        idx =+ 1

      end
      
    end
    
    redirect_to action:index, id:1
  end
end
