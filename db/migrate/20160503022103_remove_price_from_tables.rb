class RemovePriceFromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :price, :float
    remove_column :tables, :ex_rate, :float
    remove_column :tables, :weight, :float
  end
end
