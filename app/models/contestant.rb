class Contestant < ActiveRecord::Base
  attr_accessible :name, :image_url
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end
