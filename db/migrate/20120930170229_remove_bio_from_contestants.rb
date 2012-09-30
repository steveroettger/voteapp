class RemoveBioFromContestants < ActiveRecord::Migration
  def change
    remove_column :contestants, :bio
  end
end
