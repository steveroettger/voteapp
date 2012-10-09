class Contestant < ActiveRecord::Base
  attr_accessible :name, :image_url, :age, :vocation, :bio, :fb_link, :twitter_link, :profile_img
  
  has_many :contestant_votes
  
  def votes
    read_attribute(:votes) || contestant_votes.sum(:value)
  end
    
  def car_position
    #total track = 480px
    #to make car start at beginning of track :: 480px - 43px (car height) = 437 px
    if (437 - contestant_votes.sum(:value)) <= 50
      car_position = 50
    else
      car_position = 437 - contestant_votes.sum(:value)
    end
  end
end
