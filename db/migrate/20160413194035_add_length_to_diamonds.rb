class AddLengthToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :length, :float
  end
end
