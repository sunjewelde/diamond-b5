class RemovePrice2FromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :price, :decimal
  end
end
