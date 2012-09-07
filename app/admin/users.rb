ActiveAdmin.register User do
  menu priority: 1
  index do
    column :id
    column :name
    column :email
    column :gender
    column :oauth_expires_at
    column :created_at
    column :updated_at
    
    default_actions
  end
end
