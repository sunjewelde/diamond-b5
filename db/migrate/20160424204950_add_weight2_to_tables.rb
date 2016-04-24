class AddWeight2ToTables < ActiveRecord::Migration
  def change
    add_column :tables, :weight2, :decimal, precision: 2, scale: 1
  end
end
