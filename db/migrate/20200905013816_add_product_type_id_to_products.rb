class AddProductTypeIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :product_type, null: false, foreign_key: true
  end
end
