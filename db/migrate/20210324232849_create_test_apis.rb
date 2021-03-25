class CreateTestApis < ActiveRecord::Migration[6.0]
  def change
    create_table :test_apis do |t|
      t.integer :fakeId
      t.string :title
      t.string :body
      t.integer :userId

      t.timestamps
    end
  end
end
