class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      t.date :date
      t.float :index1
      t.float :index2
      t.float :index3
      t.float :index4
      t.float :index5
      t.float :price1
      t.float :price2
      t.float :price3
      t.float :price4
      t.float :price5

      t.timestamps null: false
    end
  end
end
