ActiveAdmin.register Contestant do
    menu priority: 2
    index do
      column :id
      column :name
      column :image_url
      column :created_at
      column :updated_at
      
      default_actions
    end
end
