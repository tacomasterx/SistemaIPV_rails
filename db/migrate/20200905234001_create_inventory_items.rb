class CreateInventoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_items do |t|
      t.float :original_cost

      t.timestamps
    end
  end
end
