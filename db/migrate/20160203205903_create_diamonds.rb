class CreateDiamonds < ActiveRecord::Migration
  def change
    create_table :diamonds do |t|
      t.date :date
      t.float :weight
      t.string :color
      t.string :clar
      t.float :end_price
      t.string :cut_grade
      t.integer :rapnet_list_price
      t.integer :rapnet_discount
      t.integer :price_per_carat
      t.string :polish
      t.string :symmetry
      t.string :fluorescen
      t.string :certificate_id

      t.timestamps
    end
  end
end
