# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'swkim728',
  :password => 'demoPassword135',
  :domain => 'em.example.com',
  :address => 'smtp.sendgrid.net',
  :port => 2525,
  :authentication => :plain,
  :enable_starttls_auto => true
}