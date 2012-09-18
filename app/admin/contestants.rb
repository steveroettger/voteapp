ActiveAdmin.register Contestant do
    menu priority: 2
    index do
      column :id
      column :name
      column :age
      column :vocation
      column :image_url
      
      default_actions
    end
end
