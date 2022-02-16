class AddShopsIdToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_reference :employees, :shop, null: false, foreign_key: true, default: 1
  end
end
