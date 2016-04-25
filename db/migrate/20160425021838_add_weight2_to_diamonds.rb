class AddWeight2ToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :weight2, :decimal, precision: 4, scale: 2
  end
end
