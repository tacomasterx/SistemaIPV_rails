class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name_1
      t.string :last_name_2
      t.string :rfc
      t.string :address
      t.integer :phone_home
      t.integer :phone_mobile
      t.string :charge

      t.timestamps
    end
  end
end
