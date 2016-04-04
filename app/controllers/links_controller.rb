class LinksController < ApplicationController
    
    def link_params
        params.fetch(:link).permit(:name, :url, :upvotes, :category)
    end
    
    def show
        id = params[:id] # retrieve link ID from URI route
        @link = Link.find(id) # look up link by unique ID
        # will render app/views/links/show.<extenstion> by default
    end
    
    def index
        @links = Link
    end
    
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
