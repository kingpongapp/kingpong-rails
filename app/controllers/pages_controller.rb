class PagesController < ApplicationController

  def index
    render layout: false
  end

  def show
    @players = Player.all

    render :show
  end

end
