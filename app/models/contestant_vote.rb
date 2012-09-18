class ContestantVote < ActiveRecord::Base
  attr_accessible :value, :contestant, :contestant_id
  
  validates_inclusion_of :value, in: [1, 0]
end
