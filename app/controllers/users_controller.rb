class UsersController < ApplicationController
   def create
		#get the user info
		auth = request.env["omniauth.auth"]
		#whitelist 
		if  auth[:info][:email].to_s =~ /.+@wesleyan.edu/
			user = User.find_by_uid(auth["uid"]) || User.createUser(auth)
			session[:user_id] = user.id 
			session[:admin] = user.admin
			session[:authenticated] = true
			redirect_to links_path
		else
			session[:authenticated] = false
			redirect_to root_path
		end	
	end

	#log out the user
	def destroy
		session[:user_id] = nil
		redirect_to root_path
		
	end 
end
