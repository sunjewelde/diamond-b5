class AddClatToLists < ActiveRecord::Migration
  def change
    add_column :lists, :if1, :decimal, precision: 12, scale: 1
    add_column :lists, :vvs1, :decimal, precision: 12, scale: 1
    add_column :lists, :vvs2, :decimal, precision: 12, scale: 1
    add_column :lists, :vs1, :decimal, precision: 12, scale: 1
    add_column :lists, :vs2, :decimal, precision: 12, scale: 1
    add_column :lists, :si1, :decimal, precision: 12, scale: 1
    add_column :lists, :si2, :decimal, precision: 12, scale: 1
  end
end
