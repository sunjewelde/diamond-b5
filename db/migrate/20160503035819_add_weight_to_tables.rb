class AddWeightToTables < ActiveRecord::Migration
  def change
    add_column :tables, :weight2, :decimal, precision: 4, scale: 2
  end
end
