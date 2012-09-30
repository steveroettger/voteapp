class AddBioToContestantsAsText < ActiveRecord::Migration
  def change
    add_column :contestants, :bio, :text, after: :vocation
  end
end
