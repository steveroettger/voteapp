ActiveAdmin.register User do
  menu priority: 3
  
  index do
    column :id
    column :name do |user|
      link_to user.name, [:admin, user]
    end
    column :email
    column :gender
    column :oauth_expires_at
    column :created_at
    column :updated_at
    
    default_actions
  end
  
  show :title => :name do |user|
    attributes_table do
      row :id
      row :provider
      row :uid
      row :name
      row :email
      row :gender
      row :oauth_token
      row :oauth_expires_at
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end

