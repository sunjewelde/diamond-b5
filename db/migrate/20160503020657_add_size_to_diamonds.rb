class AddSizeToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :end_price, :decimal, precision: 12, scale: 1
    add_column :diamonds, :length, :decimal, precision: 10, scale: 2
    add_column :diamonds, :width, :decimal, precision: 10, scale: 2
    add_column :diamonds, :depth, :decimal, precision: 10, scale: 2
  end
end
