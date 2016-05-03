class AddPriceToTables < ActiveRecord::Migration
  def change
    add_column :tables, :price, :decimal, precision: 12, scale: 1
  end
end
