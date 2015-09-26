class AddSequenceNumberToDeckCards < ActiveRecord::Migration
  def change
    add_column :deck_cards, :sequence_number, :integer
  end
end
