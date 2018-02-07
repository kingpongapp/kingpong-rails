class PagesController < ApplicationController

  def index
    render layout: false
  end

  def home
    @players = Player.all
    @playerRank = 0

    # @topPlayers = players.find_by_score.limit(10)
    # print @topPlayers

  # Player.order('score DESC').first(10).each do |player|
  #   School.find_by_id(player.school_id)
  # end

  end

end
