class RemoveEmployeeIdFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_reference :shops, :employee, null: false, foreign_key: true
  end
end
