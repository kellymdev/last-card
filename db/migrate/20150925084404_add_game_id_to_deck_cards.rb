class AddGameIdToDeckCards < ActiveRecord::Migration
  def change
    change_table :deck_cards do |t|
      t.belongs_to :game
    end
  end
end
