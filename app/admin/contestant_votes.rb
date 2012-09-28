ActiveAdmin.register ContestantVote do
  menu priority: 5
  
  index do
    column :id
    column :user_id
    column :contestant_id
    column :value
    column :created_at
    
    default_actions
  end
  
  
end
