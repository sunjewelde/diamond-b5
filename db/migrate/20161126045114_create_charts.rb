class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.date :date
      t.string :color
      t.string :clar
      t.decimal :weight2, precision: 2, scale: 1
      t.integer :price
      t.string :cut_grade
      t.string :fluorescen

      t.timestamps null: false
    end
  end
end
