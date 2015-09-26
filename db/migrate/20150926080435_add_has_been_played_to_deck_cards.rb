class AddHasBeenPlayedToDeckCards < ActiveRecord::Migration
  def change
    add_column :deck_cards, :has_been_played, :boolean, default: false, null: false
  end
end
