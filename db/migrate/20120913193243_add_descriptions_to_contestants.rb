class AddDescriptionsToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :age, :string, after: :name
    add_column :contestants, :vocation, :string, after: :age
    add_column :contestants, :bio, :string, after: :vocation
    add_column :contestants, :fb_link, :string, after: :bio
    add_column :contestants, :twitter_link, :string, after: :fb_link
  end
end
