class AddAcceptedToPlayerGames < ActiveRecord::Migration[5.1]
  def change
    add_column :player_games, :accepted, :boolean
  end
end
