class CreateDeckCards < ActiveRecord::Migration
  def change
    create_table :deck_cards do |t|
      t.belongs_to :card
      t.timestamps null: false
    end
  end
end
