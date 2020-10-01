class CreateSaleSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_sessions do |t|

      t.timestamps
    end
  end
end
