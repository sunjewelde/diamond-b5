class CreateColumnListClars < ActiveRecord::Migration
  def change
    create_table :column_list_clars do |t|
      t.string :clar

      t.timestamps null: false
    end
  end
end
