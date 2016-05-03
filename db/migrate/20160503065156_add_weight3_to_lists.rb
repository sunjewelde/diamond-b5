class AddWeight3ToLists < ActiveRecord::Migration
  def change
    add_column :lists, :weight2, :decimal
  end
end
