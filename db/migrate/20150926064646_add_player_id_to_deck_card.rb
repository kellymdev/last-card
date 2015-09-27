class AddPlayerIdToDeckCard < ActiveRecord::Migration
  def change
    change_table :deck_cards do |t|
      t.belongs_to :player
      t.index :player_id
    end
  end
end
