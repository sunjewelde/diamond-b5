class CreateColumnListColors < ActiveRecord::Migration
  def change
    create_table :column_list_colors do |t|
      t.string :color

      t.timestamps null: false
    end
  end
end
