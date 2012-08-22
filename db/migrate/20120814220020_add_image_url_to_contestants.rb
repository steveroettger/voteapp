class AddImageUrlToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :image_url, :string, after: :name
  end
end
