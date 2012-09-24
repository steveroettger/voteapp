class Contestant < ActiveRecord::Base
  attr_accessible :name, :image_url, :age, :vocation, :bio, :fb_link, :twitter_link
  
  has_many :contestant_votes
  
  def votes
    read_attribute(:votes) || contestant_votes.sum(:value)
  end
  
  def car_position
    car_position = 365 - contestant_votes.sum(:value)
  end
end
