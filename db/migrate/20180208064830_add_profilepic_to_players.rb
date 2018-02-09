class AddProfilepicToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :profilepic, :string
  end
end
