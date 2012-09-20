class GiveawayEntry < ActiveRecord::Base
   attr_accessible :name, :email
   
   validates :name,  presence: true, length: { :maximum => 50 }
   validates :email, presence: true, length: { :maximum => 50 }

   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, format: { :with => email_regex }, uniqueness: { case_sensitive: false } 
end
