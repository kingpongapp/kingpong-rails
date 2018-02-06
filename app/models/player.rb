class Player < ApplicationRecord
  has_secure_password

  has_many :player_games
  
end
