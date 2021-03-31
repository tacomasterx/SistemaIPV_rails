class AlterQuantityFromProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :quantity, :float
  end
end
