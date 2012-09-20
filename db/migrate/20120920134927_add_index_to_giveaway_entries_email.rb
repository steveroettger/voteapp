class AddIndexToGiveawayEntriesEmail < ActiveRecord::Migration
  def change
    add_index :giveaway_entries, :email, unique: true
  end
end
