ActiveAdmin.register Contestant do
    menu priority: 4
    
    index do
      column :id
      column :name do |contestant|
        link_to contestant.name, [:admin, contestant]
      end
      column :age
      column :vocation
      column :fb_link
      column :twitter_link
      column :youtube_link
      column :image_url
      column :profile_img
      
      default_actions
    end
    
    show :title => :name do |contestant|
      attributes_table do
        row :id
        row :name
        row :age
        row :vocation
        row :bio
        row :fb_link
        row :twitter_link
        row :youtube_link
        row :image_url
        row :profile_img
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
        f.input :fb_link
        f.input :twitter_link
        f.input :youtube_link
        f.input :image_url
        f.input :profile_img
        f.input :bio
      end
      f.buttons
    end
end
