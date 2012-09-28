#app/admin/admin_users.rb
ActiveAdmin.register AdminUser do
  menu priority: 2

  index do
    column :email do |admin_user|
      link_to admin_user.email, [:admin, admin_user]
    end
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  show :title => :email do |admin_user|
    attributes_table do
      row :id
      row :email
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
    
  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
    end
    f.buttons
  end
  
  #app/models/admin_user.rb
  #after_create { |admin| admin.send_reset_password_instructions }
  #  def password_required?
  #    new_record? ? false : super
  #  end
    
  #app/models/admin_user.rb
  #before_destroy :raise_if_last
  #  def raise_if_last
  #    if AdminUser.count < 2
  #      raise "Can't delete last admin user"
  #    end
  #  end
end