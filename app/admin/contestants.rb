ActiveAdmin.register Contestant do
    menu priority: 4
    
    index do
      column :id
      column :name do |contestant|
        link_to contestant.name, [:admin, contestant]
      end
      column :age
      column :vocation
      column :image_url
      
      default_actions
    end
    
    show :title => :name do |contestant|
      attributes_table do
        row :id
        row :name
        row :age
        row :vocation
        row :image_url
        row :bio
        row :fb_link
        row :twitter_link
        row :created_at
        row :updated_at
      end
      active_admin_comments
    end
    
    form do |f|
      f.inputs "Contestant Information" do
        f.input :name
        f.input :age
        f.input :vocation
        f.input :bio, :as => :text
        f.input :image_url
        f.input :fb_link, :label => "Facebook Link"
        f.input :twitter_link
      end
      f.buttons
    end
end
