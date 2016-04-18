class UsersController < ApplicationController
   def users_params
        params.fetch(:user).permit(:email)
   end
    
   
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
			session[:error] = "Must have a wesleyan email address"
			redirect_to root_path
		end	
	end
	
	def new_admin
	   @email = params[:email]
	   logger.info params[:email]
       User.promote_to_admin(@email)
       
       redirect_to links_path
    end
	
	def index
	    redirect_to links_path if current_user
	    
	end

	#log out the user
	def destroy
		session[:user_id] = nil
		session[:authenticated] = false
		redirect_to root_path
		
	end
end
