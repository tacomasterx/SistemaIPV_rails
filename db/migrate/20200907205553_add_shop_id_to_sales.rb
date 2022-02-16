class AddShopIdToSales < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :shop, null: false, foreign_key: true
  end
end
