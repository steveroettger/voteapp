class AddPhoneToTestDrivers < ActiveRecord::Migration
  def change
    add_column :test_drivers, :phone, :string, after: :email
  end
end
