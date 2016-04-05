class LinksController < ApplicationController
    
    def link_params
        params.require(:link).permit(:name, :url, :upvotes, :category)
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
    end
    
    # show by category
    #def show_by_category
    #    #@links = Link.where(category: params[:category])
    #    logger.info("%%%%%"+params[:category].to_s)
    #end
    
    def new
    # default: render 'new' template
    end

    def create
        @link = Link.create!(link_params)
        flash[:notice] = "#{@link.name} was successfully submitted."
        redirect_to links_path
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
