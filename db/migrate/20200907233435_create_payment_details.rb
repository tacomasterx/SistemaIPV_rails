class CreatePaymentDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_details do |t|
      t.float :payment
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
