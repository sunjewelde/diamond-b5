class AddShapeToDiamonds < ActiveRecord::Migration
  def change
    add_column :diamonds, :shape, :string
    add_column :diamonds, :depth_percent, :decimal, precision: 4, scale: 1
    add_column :diamonds, :table_percent, :decimal, precision: 4, scale: 1
    add_column :diamonds, :girdle_thin, :string
    add_column :diamonds, :girdle_thick, :string
  end
end
