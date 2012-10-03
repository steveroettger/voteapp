ActiveAdmin.register ContestantVote do
  menu priority: 5
  filter :id
  filter :contestant_id
  filter :user_id
  
  index do
    column :id
    column :user_id
    column :contestant_id
    column :value
    column :created_at
    
    default_actions
  end
  
  scope :all, :default => true
  scope :by_contestant do |contestant_votes|
    contestant_votes.where(:contestant_id == 1)
  end 
  
  
end
