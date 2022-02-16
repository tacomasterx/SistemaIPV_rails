class AddSaleIdToSaleSessions < ActiveRecord::Migration[6.0]
  def change
    add_reference :sale_sessions, :sale, null: false, foreign_key: true
  end
end
