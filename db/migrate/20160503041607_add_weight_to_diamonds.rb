class AddWeightToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :weight, :float
  end
end
