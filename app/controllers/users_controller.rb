class UsersController < ApplicationController
    include UsersHelper
	
    # def users_params
    #     params.fetch(:user).permit(:email)
    # end
    
   
    def create
		#get the user info
		
		auth = request.env["omniauth.auth"]
		if auth == nil and 
			if session[:temp] == true
			  auth = {:info => {:email => "jkoshakow@wesleyan.edu"} }
			else
			  auth = {:info => {:email => "koshy44@gmail.com"} }	
			end
		end
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
	  #UsersHelper.test
	  @email = params[:email]
	  logger.info params[:email]
      begin
        User.promote_to_admin(@email)
        redirect_to links_path
      rescue 
        session[:error] = "Must be an email with an already existing account"
        redirect_to approval_path
      end
       
    end
	
	def index
	    redirect_to links_path if current_user
	end

	#log out the user
	def destroy
		session[:user_id] = nil
		session[:authenticated] = false
		session[:admin] =nil
		redirect_to root_path
	end
end
