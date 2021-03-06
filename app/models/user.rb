class User < ActiveRecord::Base
    def self.createUser(auth)
      create! do |user|
         user.uid=auth["uid"]
         user.email = auth[:info][:email]
         user.name = auth[:info][:name]
         if user.email == "mjkingsley@wesleyan.edu" or user.email == "skim09@wesleyan.edu" or user.email == "yliu04@wesleyan.edu" or user.email == "jkoshakow@wesleyan.edu"
           user.admin = true
         else
           user.admin = false
         end
      end
    end
    
    def self.promote_to_admin(email)
      #does email need to be converted into a string?
      user = User.find_by(email: email)
      if user == nil 
        raise "Email must have an account"
      else
        user.admin = true
        user.save
      end
    end
end