class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.date :date
      t.float :weight
      t.string :color
      t.string :clar
      t.float :price
      t.float :ex_rate
      t.timestamps
    end
  end
end
