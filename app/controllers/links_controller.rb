class LinksController < ApplicationController
    
    def link_params
        params.fetch(:link).permit(:name, :url, :upvotes, :category, :comments)
    end
    
    def show
        id = params[:id] # retrieve link ID from URI route
        @link = Link.find(id) # look up link by unique ID
        # will render app/views/links/show.<extenstion> by default
    end
    
    def index
        #@links = Link
        @inspiration = Link.where(category: "Inspiration")
        @internships = Link.where(category: "Internships")
        @grants = Link.where(category: "Grants")
        @jobs = Link.where(category: "Jobs")
        @other = Link.where(category: "Other")
        
        session[:links] = @links
    end
    
    def new
       @link = Link.new(params[:link])
    end

    def create

        @link = Link.new(link_params)
        
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
    
    def update
        redirect_to links_path
    end

    def destroy
        redirect_to links_path
    end

end
