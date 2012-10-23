class AddTestDriveVotesToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :test_drive_votes, :integer
  end
end
