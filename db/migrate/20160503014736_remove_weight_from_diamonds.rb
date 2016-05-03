class RemoveWeightFromDiamonds < ActiveRecord::Migration
  def change
    remove_column :diamonds, :weight, :float
  end
end
