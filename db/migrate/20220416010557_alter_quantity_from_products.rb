class AlterQuantityFromProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :quantity, :float
  end
end
