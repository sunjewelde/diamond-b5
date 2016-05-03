class AddPrice2ToTables < ActiveRecord::Migration
  def change
    add_column :tables, :price, :integer
  end
end
