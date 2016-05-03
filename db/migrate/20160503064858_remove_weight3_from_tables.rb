class RemoveWeight3FromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :weight2, :decimal
  end
end
