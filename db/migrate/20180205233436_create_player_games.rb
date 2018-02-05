class CreatePlayerGames < ActiveRecord::Migration[5.1]
  def change
    create_table :player_games do |t|
      t.integer :player_id
      t.integer :game_id
      t.boolean :win

      t.timestamps
    end
  end
end
