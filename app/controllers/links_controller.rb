class LinksController < ApplicationController
    
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

        @link = Link.create(link_params)
        
        if @link.valid? 
            @link.save
            AddlinkMailer.linkrequest_email(@link).deliver_now
            redirect_to links_path
            #Successfully submitted
        else 
             flash[:errors] = @link.errors.messages
             redirect_to new_link_path
        end
        #AdminMailer.adding_link_email().deliver
    end
    
    def edit
        @link = Link.find params[:id]
    end
    
    def report
        @link = Link.find params[:id] 
    end
    
    def sendreport
        @link = link
        AddlinkMailer.reportrequest_email(@link).deliver_now
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
    

end
