class AddReferencesToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :sale, null: false, foreign_key: true
    add_reference :transactions, :inventory_item, null: false, foreign_key: true
  end
end
