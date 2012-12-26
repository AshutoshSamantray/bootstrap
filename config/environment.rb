# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bootstrap::Application.initialize!

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "gmail.com", 
  :user_name => "ap99202@gmail.com",
  :password => "kill-9-1",
  :authentication => 'plain', 
  :enable_starttls_auto => true
}
