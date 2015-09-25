class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.belongs_to :card
      t.timestamps null: false
    end
  end
end
