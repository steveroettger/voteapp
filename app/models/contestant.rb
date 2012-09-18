class Contestant < ActiveRecord::Base
  attr_accessible :name, :image_url, :age, :vocation, :bio, :fb_link, :twitter_link
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end
