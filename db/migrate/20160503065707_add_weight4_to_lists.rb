class AddWeight4ToLists < ActiveRecord::Migration
  def change
    add_column :lists, :weight2, :decimal, precision: 2, scale: 1
  end
end
