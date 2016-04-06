class AddlinkMailer < ApplicationMailer
    default from: "notifications@links.com"
    
    def linkrequest_email(link)
        @link = link
        mail(to: "ezornow@wesleyan.edu", subject: 'New Link Request')
    end
end
