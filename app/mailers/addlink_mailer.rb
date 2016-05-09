class AddlinkMailer < ApplicationMailer
    default from: "notifications@links.com"
    
    def linkrequest_email(link)
        @link = link
        mail(to: "skim09@wesleyan.edu", subject: 'New Link Request')
    end
    
    def reportrequest_email(reportname, reportreason)
        @reportname = reportname
        @reportreason = reportreason
        mail(to: "skim09@wesleyan.edu", subject: 'Link Reported')
    end
    
    def otherreportrequest_email(reportname, otherreportreason)
        @reportname = reportname
        @otherreportreason = otherreportreason
        mail(to: "skim09@wesleyan.edu", subject: 'Link Reported')
    end
    
    def requestapproved_email(link, feedback)
        @link = link
        @feedback = feedback
        mail(to: @link.email, subject: 'Link Request Approved')
    end
    
    def requestdenied_email(link, feedback)
        @link = link
        @feedback = feedback
        mail(to: @link.email, subject: 'Link Request Denied')
    end
end
