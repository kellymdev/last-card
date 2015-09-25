class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :value
      t.string :suit
      t.string :points
      t.timestamps null: false
    end
  end
end
