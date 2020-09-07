class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :pseudonym
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
