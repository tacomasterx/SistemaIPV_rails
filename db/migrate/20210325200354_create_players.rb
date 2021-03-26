class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.boolean :linked_to_steroids

      t.timestamps
    end
  end
end
