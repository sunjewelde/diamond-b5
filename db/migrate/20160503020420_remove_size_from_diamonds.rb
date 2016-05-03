class RemoveSizeFromDiamonds < ActiveRecord::Migration
  def change
    remove_column :diamonds, :end_price, :float
    remove_column :diamonds, :length, :float
    remove_column :diamonds, :width, :float
    remove_column :diamonds, :depth, :float
  end
end
