class GamesController < ApplicationController

  def index
    
  end
  def create
    players = %w(John Paul Ringo George)

    Player.all.each do |player|
      players.push(player)
    end


    teams = RoundRobinTournament.schedule(players)

    
    redirect_to action:index, id:1
  end
end
