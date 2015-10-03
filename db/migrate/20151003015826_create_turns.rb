class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.belongs_to :player
      t.belongs_to :deck_card
      t.timestamps null: false
    end
  end
end
