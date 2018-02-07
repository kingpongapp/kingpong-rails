class PagesController < ApplicationController

  def index
    render layout: false
  end

  def show
    render :show
  end

end
