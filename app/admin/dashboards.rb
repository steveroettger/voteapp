ActiveAdmin::Dashboards.build do
  section "Recently Created Users" do
    table_for User.order("created_at desc").limit(5) do
      column :name do |user|
        link_to user.name, [:admin, user]
      end
      column :email
      column :gender
    end
    strong { link_to "View All Users", admin_users_path }  
  end

end
