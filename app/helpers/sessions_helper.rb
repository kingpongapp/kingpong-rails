module SessionsHelper

  def current_user
    Player.find_by(id: session[:player_id])
  end

  def logged_in?
    if current_user # or !! current_user
      true
    else
      false
    end
  end

end
