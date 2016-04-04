class AdminMailer < ApplicationMailer
    default :from => "skim09@wesleyan.edu"
    
    def adding_link_email
        @url  = "https://sangwon-kim-workspace-skim09.c9users.io/links/new"
        mail(:to => "skim09@wesleyan.edu", :subject => "New Link Request")
    end
end
