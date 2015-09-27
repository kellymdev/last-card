class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :score, default: 0
      t.belongs_to :game
      t.index :game_id
      t.timestamps null: false
    end
  end
end
