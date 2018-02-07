class PagesController < ApplicationController

  def index
    render layout: false
  end

  def home
    players = Player.all
    @playerRank = 0

    # @topPlayers = Player.order('score DESC').limit(10)
    # print @topPlayers

   @topPlayers = Player.order('score DESC').each do |player|
    player.find_by_score(player.score)
  end

  end

end
