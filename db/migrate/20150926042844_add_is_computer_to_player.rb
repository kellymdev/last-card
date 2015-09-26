class AddIsComputerToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :is_computer, :boolean, default: false
  end
end
