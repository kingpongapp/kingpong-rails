class PagesController < ApplicationController

  def index
    render layout: false
  end

  def home
    @playerRank = 0
    @topPlayers = Player.order('score DESC').limit(10)

    
  end

end
