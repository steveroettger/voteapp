class AddIndexToTestDriverEmail < ActiveRecord::Migration
  def change
    add_index :test_drivers, :email, unique: true
  end
end
