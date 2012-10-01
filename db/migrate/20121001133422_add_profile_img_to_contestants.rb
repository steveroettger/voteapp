class AddProfileImgToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :profile_img, :string, after: :image_url
  end
end
