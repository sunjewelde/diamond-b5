class RemoveClarFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :if1, :float
    remove_column :lists, :vvs1, :float
    remove_column :lists, :vvs2, :float
    remove_column :lists, :vs1, :float
    remove_column :lists, :vs2, :float
    remove_column :lists, :si1, :float
    remove_column :lists, :si2, :float
    remove_column :lists, :weight, :float
  end
end
