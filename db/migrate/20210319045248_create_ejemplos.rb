class CreateEjemplos < ActiveRecord::Migration[6.0]
  def change
    create_table :ejemplos do |t|
      t.string :sku

      t.timestamps
    end
  end
end
