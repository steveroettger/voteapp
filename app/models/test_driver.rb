class TestDriver < ActiveRecord::Base
   attr_accessible :name, :email, :phone
   
   validates :name,  presence: true, length: { :maximum => 50 }
   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { :maximum => 50 },
                     format: { :with => email_regex }, uniqueness: { case_sensitive: false }
   phone_regex = /\A\S[0-9\+\/\(\)\s\-]*\z/i
   validates :phone, length: { :minimum => 6, :maximum => 25 }, 
                     format: { :with =>  phone_regex }
end
