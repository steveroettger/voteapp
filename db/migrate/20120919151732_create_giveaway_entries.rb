class CreateGiveawayEntries < ActiveRecord::Migration
  def change
    create_table :giveaway_entries do |t|
      t.string :name
      t.string :email
      
      t.timestamps
    end
  end
end
