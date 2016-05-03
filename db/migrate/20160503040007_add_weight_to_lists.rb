class AddWeightToLists < ActiveRecord::Migration
  def change
    add_column :lists, :weight2, :decimal, precision: 4, scale: 2
  end
end
