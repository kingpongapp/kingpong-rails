class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :nickname
      t.text :image_url
      t.integer :score

      t.timestamps
    end
  end
end
