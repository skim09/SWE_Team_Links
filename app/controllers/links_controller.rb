class LinksController < ApplicationController

    # before_filter :authenticate, only: [:new] 
    
    def link_params
        params.fetch(:link).permit(:name, :url, :upvotes, :category, :comments, :reportreason, :otherreportreason, :link)
    end
    
    def show
        id = params[:id] # retrieve link ID from URI route
        @link = Link.find(id) # look up link by unique ID
        # will render app/views/links/show.<extenstion> by default
    end
    
    def index
        #@links = Link
        @inspiration = Link.where(category: "Inspiration", status: true)
        @internships = Link.where(category: "Internships", status: true)
        @grants = Link.where(category: "Grants", status: true)
        @jobs = Link.where(category: "Jobs", status: true)
        @other = Link.where(category: "Other", status: true)
        session[:links] = @links
        @number_of_unapproved = Link.where(status: false).size
    end
    
    def new
        if !session[:authenticated]
            session[:error] = "Must be logged in to add links"
            redirect_to root_path
        end
        @link = Link.new
    end

    def create

        if session[:admin]
            @link = Link.new(link_params.merge({:status => true, :upvotes => 0, :email => current_user.email }))
        else
            @link = Link.new(link_params.merge({:status => false, :upvotes => 0, :email => current_user.email }))
        end
        
        if @link.save 
            AddlinkMailer.linkrequest_email(@link).deliver_now
            redirect_to links_path
        else 
             
             @link.delete
             
             render 'new'
        end
  
    end
    
    def edit
        @link = Link.find params[:id]
    end
    
    def report
        @link = Link.find params[:id] 
    end
    
    def update
        
        redirect_to links_path
    end

    def destroy
        redirect_to links_path
    end
    
    def reportsend
        @link = Link.find params[:link_id]
        #@link.update_attributes!(link_params)
        @link.update(reportreason: params[:reportreason])
        if @link.reportreason == "Other"
            @link.update(otherreportreason: params[:otherreportreason])
            AddlinkMailer.otherreportrequest_email(@link).deliver_now
        else
            AddlinkMailer.reportrequest_email(@link).deliver_now
        end
        redirect_to links_path
    end
    
    
    def approve_link
        @links = Link.where(status: false)
    end
    
    def approve_or_decline
        link = Link.find(params[:link_id])
        feedback = params[:feedback]
        if params[:commit]=="Approve"
            AddlinkMailer.requestapproved_email(link, feedback).deliver_now
            link.update(status: true)
        else
            AddlinkMailer.requestdenied_email(link, feedback).deliver_now
            link.destroy
        end
        @links = Link.where(status: false)
        respond_to do |format| 
            format.js
        end
    end

    def upvote
        
        @link = Link.find(params[:id])
        
        @link.upvotes += 1
        @link.save
        
        respond_to do |format|
            format.js 
        end


    end
    
end
