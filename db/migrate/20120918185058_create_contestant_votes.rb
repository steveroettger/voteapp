class CreateContestantVotes < ActiveRecord::Migration
  def change
    create_table :contestant_votes do |t|
      t.belongs_to :contestant
      t.belongs_to :user
      t.integer :value
            
      t.timestamps
    end
  end
end
