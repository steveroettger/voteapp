class Contestant < ActiveRecord::Base
  attr_accessible :name, :image_url, :age, :vocation, :bio, :fb_link, :twitter_link, :youtube_link, :profile_img
  
  has_many :contestant_votes
  
  def votes
    read_attribute(:votes) || contestant_votes.sum(:value)
  end
    
  def car_position
    #total track = 480px
    #to make car start at beginning of track :: 480px - 43px (car height) = 437 px
    #if (437 - contestant_votes.sum(:value)) <= 50
    #  car_position = 50
    #else
    #  car_position = 437 - contestant_votes.sum(:value)
    #end
    updated_vote = contestant_votes.sum(:value) * 0.50
    
    if contestant_votes.sum(:value) >= 150
      if 437 - updated_vote <= 50
        car_position = 50
      else
        car_position = 437 - updated_vote
      end
    else
      car_position = (437 - contestant_votes.sum(:value))
    end
  end  
end
