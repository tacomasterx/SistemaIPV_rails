class AddProductIdToInventoryItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventory_items, :product, null: false, foreign_key: true
  end
end
