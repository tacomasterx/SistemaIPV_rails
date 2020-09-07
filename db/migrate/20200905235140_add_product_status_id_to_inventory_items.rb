class AddProductStatusIdToInventoryItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventory_items, :product_status, null: false, foreign_key: true
  end
end
