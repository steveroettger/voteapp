class CreateTestDrivers < ActiveRecord::Migration
  def change
    create_table :test_drivers do |t|
      t.string :name
      t.string :email
      
      t.timestamps
    end
  end
end
