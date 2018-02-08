class PagesController < ApplicationController

  def index
    render layout: false
  end

  def home
    @playerRank = 0
    @topPlayers = Player.order('score DESC').limit(10)

    client = Twitter::REST::Client.new do |config|
  		config.consumer_key    = ENV["CONSUMER_KEY"]
  		config.consumer_secret = ENV["CONSUMER_SECRET"]
	end

	@tweets = client.search("@kingpongapp", result_type: "recent")
  
  end

end
