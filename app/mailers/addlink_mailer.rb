class AddlinkMailer < ApplicationMailer
    default from: "notifications@links.com"
    
    def linkrequest_email(link)
        @link = link
        mail(to: "mjkingsley@wesleyan.edu", subject: 'New Link Request')
    end
end
