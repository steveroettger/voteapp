class Contestant < ActiveRecord::Base
  attr_accessible :name, :image_url, :age, :vocation, :bio, :fb_link, :twitter_link, :profile_img
  
  has_many :contestant_votes
  
  def votes
    read_attribute(:votes) || contestant_votes.sum(:value)
  end
  
#  def self.by_votes
#    select('contestants.*, coalesce(value, 0) as votes').
#    joins('left join contestant_votes on contestant_id=contestants.id').
#    order('votes desc').limit(1)
#  end
  
  def car_position
    #total track = 480px
    #to make car start at beginning of track :: 480px - 43px (car height) = 437 px
    car_position = 437 - contestant_votes.sum(:value)
  end
end
