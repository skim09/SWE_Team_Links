class AddlinkMailer < ApplicationMailer
    default from: "notifications@links.com"
    
    def linkrequest_email(link)
        @link = link
        mail(to: "skim09@wesleyan.edu", subject: 'New Link Request')
    end
    
    def reportrequest_email(link)
        @link = link
        mail(to: "skim09@wesleyan.edu", subject: 'Link Reported')
    end
    
    def otherreportrequest_email(link)
        @link = link
        mail(to: "skim09@wesleyan.edu", subject: 'Link Reported')
    end
end
