class RemoveWeight4FromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :weight2, :decimal
  end
end
