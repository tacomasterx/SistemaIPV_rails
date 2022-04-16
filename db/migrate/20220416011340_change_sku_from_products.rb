class ChangeSkuFromProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :sku, :string
  end
end
