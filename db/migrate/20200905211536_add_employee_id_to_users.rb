class AddEmployeeIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :employee, null: false, foreign_key: true, default: 1
  end
end
