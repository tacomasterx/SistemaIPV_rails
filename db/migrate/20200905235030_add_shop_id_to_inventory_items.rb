class AddShopIdToInventoryItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventory_items, :shop, null: false, foreign_key: true
  end
end
