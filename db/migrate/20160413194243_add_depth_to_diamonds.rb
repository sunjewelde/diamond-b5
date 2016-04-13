class AddDepthToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :depth, :float
  end
end
