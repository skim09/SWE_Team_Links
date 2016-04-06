class AddlinkMailer < ApplicationMailer
    default from: "notifications@links.com"
    
    def linkrequest_email(link)
        @link = link
        mail(to: "skim09@wesleyan.edu", subject: 'New Link Request')
    end
end
