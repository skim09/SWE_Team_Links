class AddlinkMailer < ApplicationMailer
    default from: "notifications@links.com"
    
    def linkrequest_email(link)
        @link = link
        mail(to: "swkim728@gmail.com", subject: 'New Link Request')
    end
end
