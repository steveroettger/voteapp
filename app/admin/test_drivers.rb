ActiveAdmin.register TestDriver do
  menu priority: 7
  
  index do
    column :id
    column :name do |test_driver|
      link_to test_driver.name, [:admin, test_driver]
    end
    column :email
    column :phone
    column :created_at
    
    default_actions
  end
  
  show :title => :name do |test_driver|
    attributes_table do
      row :id
      row :name
      row :email
      row :phone
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
