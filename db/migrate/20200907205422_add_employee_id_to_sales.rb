class AddEmployeeIdToSales < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :employee, null: false, foreign_key: true
  end
end
