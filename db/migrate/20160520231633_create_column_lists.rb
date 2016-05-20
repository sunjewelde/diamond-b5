class CreateColumnLists < ActiveRecord::Migration
  def change
    create_table :column_lists do |t|
      t.string :color
      t.string :clar

      t.timestamps null: false
    end
  end
end
