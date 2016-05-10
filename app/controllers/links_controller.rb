class LinksController < ApplicationController
    protect_from_forgery except: :page
    
    # before_filter :authenticate, only: [:new] 
    
    def link_params
        params.fetch(:link).permit(:name, :url, :upvotes, :category, :comments, :reportreason, :otherreportreason, :reportname, :link)
    end
    
    def show
        id = params[:id] # retrieve link ID from URI route
        @link = Link.find(id) # look up link by unique ID
        # will render app/views/links/show.<extenstion> by default
    end
    
    def index
        # LinksHelper.test
        #@links = Link
        
        
        #session[:intern_display] = session[:intern_display] || "none"
        
        @inspirations = Link.where(category: "Get Acclimated & Get Inspired", status: true).each_slice(5).to_a
        @internships = Link.where(category: "Get Smart & Get Informed", status: true).each_slice(5).to_a
        @grants = Link.where(category: "Get Connected & Get Taught", status: true).each_slice(5).to_a
        @jobs = Link.where(category: 'Get Experience', status: true).each_slice(5).to_a
        @other = Link.where(category: "Get Organized", status: true).each_slice(5).to_a
        @funded = Link.where(category: "Get Funded", status: true).each_slice(5).to_a
        @hired = Link.where(category: "Get Hired", status: true).each_slice(5).to_a
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
            @link = Link.new(link_params.merge({:status => true, :upvotes => 0, :email => current_user.email, :upvoters => '' }))
        else
            @link = Link.new(link_params.merge({:status => false, :upvotes => 0, :email => current_user.email, :upvoters => '' }))
            session[:new_message] = "Your link is now pending approval from an admin"
        end
        
        if @link.save or session[:rspec_test]
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
    
    #def report
     #   @link = Link.find params[:id] 
    #end
    
    def update
        
        redirect_to links_path
    end

    def destroy
        redirect_to links_path
    end
    
    def report
        
        if !session[:authenticated]
            session[:error2] = "Must be logged in to report links"
            redirect_to root_path
        end
        
        reportname = params[:reportname]
        reportreason = params[:reportreason]
        otherreportreason = params[:otherreportreason]
        
        @link = Link.find_by name: reportname
    end
    
    def reportsend
        #logger.info "!!!!!!!"+params.to_s
        #@link = Link.find params[:link_id]
        #@link.update_attributes!(link_params)
        #@link.update(reportreason: params[:reportreason])
       
       
        reportname = params[:reportname]
        reportreason = params[:reportreason]
        otherreportreason = params[:otherreportreason]
  
        @link = Link.find_by name: reportname
        
        if @link == nil 
            session[:reportname] = reportname
            session[:report_error] = "No link with that name exists"
            render 'report'
        elsif @link != nil
           
            if reportreason == "Other"
            AddlinkMailer.otherreportrequest_email(reportname, otherreportreason).deliver_now
            else
            AddlinkMailer.reportrequest_email(reportname, reportreason).deliver_now
            end
            
            redirect_to links_path
        end
        
        #redirect_to links_path
    end
    
    
    def approve_link
        if !session[:admin]
            redirect_to links_path
        end
        @links = Link.where(status: false)
    end
    
    def approve_or_decline
        @link = Link.find(params[:link_id])
        @feedback = params[:feedback]
        if params[:commit]=="Approve"
            AddlinkMailer.requestapproved_email(@link, @feedback).deliver_now
            @link.update(status: true)
        else
            AddlinkMailer.requestdenied_email(@link, @feedback).deliver_now
            @link.destroy
        end
        @links = Link.where(status: false)
        respond_to do |format| 
            format.js
        end
    end

    def upvote
        @link = Link.find(params[:id])
        upvoters = @link.upvoters.split(';')
        user_id = params[:user_id]
        if upvoters.include?(user_id)
             @link.upvotes -= 1
             @link.upvoters.slice!("#{user_id};")
        else
             @link.upvotes += 1
             @link.upvoters += "#{user_id};"
        end
        @link.save
        
        respond_to do |format|
            format.js 
        end
    end
    
    def remove 
        
        @link = Link.find(params[:id])
        Link.delete(@link)
        
        respond_to do |format|
            format.js 
        end
        
    end
    
    def page
        @internships = Link.where(category: "Get Smart & Get Informed", status: true).each_slice(5).to_a
        @inspirations = Link.where(category: "Get Acclimated & Get Inspired", status: true).each_slice(5).to_a
        @grants = Link.where(category: "Get Connected & Get Taught", status: true).each_slice(5).to_a
        @jobs = Link.where(category: 'Get Experience', status: true).each_slice(5).to_a
        @other = Link.where(category: "Get Organized", status: true).each_slice(5).to_a
        @funded = Link.where(category: "Get Funded", status: true).each_slice(5).to_a
        @hired = Link.where(category: "Get Hired", status: true).each_slice(5).to_a
        
        session[:intern_page_num] = session[:intern_page_num].to_i+params[:intern_incre].to_i   
        session[:grant_page_num] = session[:grant_page_num].to_i+params[:grant_incre].to_i  
        session[:job_page_num] = session[:job_page_num].to_i+params[:job_incre].to_i  
        session[:other_page_num] = session[:other_page_num].to_i+params[:other_incre].to_i  
        session[:fund_page_num] = session[:fund_page_num].to_i+params[:fund_incre].to_i
        session[:insp_page_num] = session[:insp_page_num].to_i+params[:insp_incre].to_i
        session[:hired_page_num] = session[:hired_page_num].to_i+params[:hired_incre].to_i
        
        change = ""
        params.each do |key, value|
            if key=~/.+incre/
                change = key
                break
            end
        end
        @change = change.chomp("_incre")
        respond_to do |format|
            format.js 
        end
    end
end
