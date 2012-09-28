ActiveAdmin.register GiveawayEntry do
  menu priority: 6
  
  index do
    column :id
    column :name do |giveaway_entry|
      link_to giveaway_entry.name, [:admin, giveaway_entry]
    end
    column :email
    column :created_at
    
    default_actions
  end
  
  show :title => :name do |giveaway_entry|
    attributes_table do
      row :id
      row :name
      row :email
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
