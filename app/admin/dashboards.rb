ActiveAdmin::Dashboards.build do
  
  section "Recently Created Users" do
    table_for User.order("created_at desc").limit(5) do
      column :name do |user|
        link_to user.name, [:admin, user]
      end
      column :email
      column :gender
      column :created_at
    end
    strong { link_to "View All Users", admin_users_path }  
  end
  
  section "Recently Created Giveaway Entries" do
    table_for GiveawayEntry.order("created_at desc").limit(5) do
      column :name do |giveaway_entry|
        link_to giveaway_entry.name, [:admin, giveaway_entry]
      end
      column :email
      column :created_at
    end
    strong { link_to "View All Giveaway Entries", admin_giveaway_entries_path }  
  end
  
  section "Recently Created Test Drivers" do
    table_for TestDriver.order("created_at desc").limit(5) do
      column :name do |test_driver|
        link_to test_driver.name, [:admin, test_driver]
      end
      column :email
      column :phone
      column :created_at
    end
    strong { link_to "View All Test Drivers", admin_test_drivers_path }  
  end
end
