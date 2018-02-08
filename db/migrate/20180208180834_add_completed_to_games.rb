class AddCompletedToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :completed, :boolean
  end
end
