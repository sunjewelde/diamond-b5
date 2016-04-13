class AddWidthToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :width, :float
  end
end
