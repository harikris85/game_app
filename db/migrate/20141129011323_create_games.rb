class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :address
      t.text :description
      t.string :sport
      t.datetime :game_time
      t.integer :user_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :games, [:user_id, :created_at]
  end
end
