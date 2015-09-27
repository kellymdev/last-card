class AddGameIdToDeckCards < ActiveRecord::Migration
  def change
    change_table :deck_cards do |t|
      t.belongs_to :game
      t.index :game_id
    end
  end
end
