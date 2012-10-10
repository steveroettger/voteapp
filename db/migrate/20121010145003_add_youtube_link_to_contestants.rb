class AddYoutubeLinkToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :youtube_link, :string, after: :twitter_link
  end
end
