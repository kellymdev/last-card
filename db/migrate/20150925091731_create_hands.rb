class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.belongs_to :player
      t.belongs_to :deck
      t.timestamps null: false
    end
  end
end