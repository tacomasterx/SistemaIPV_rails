class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :unit
      t.integer :quantity
      t.float :weight
      t.float :price_unit
      t.integer :profit
      t.float :price_2
      t.float :price_3
      t.float :price_4
      t.float :price_5
      t.string :brand
      t.integer :sku

      t.timestamps
    end
  end
end
