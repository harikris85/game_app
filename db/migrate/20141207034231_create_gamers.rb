class CreateGamers < ActiveRecord::Migration
  def change
    create_table :gamers do |t|
      t.integer :player_id
      t.integer :going_game_id

      t.timestamps
    end
    add_index :gamers, :going_game_id
    add_index :gamers, :player_id
    add_index :gamers, [:player_id, :going_game_id], unique: true
  end
end
