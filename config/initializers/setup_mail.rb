require 'development_mail_interceptor'
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.default  :charset => "utf-8" 
 ActionMailer::Base.smtp_settings = {
   :address                => "smtp.gmail.com",
   :port                   => 587,
   :domain                => "gmail.com",
   :user_name              => "papandonko@gmail.com",
   :password               => "pany19tanguy84",
   :authentication         => "plain",
   :enable_starttls_auto   => true
 }
 
  #gmail configuration for heroku 
#config.action_mailer.default_url_options = { :host => 'it2.herokuapp.com' }
#config.action_mailer.delivery_method = :smtp
#config.action_mailer.perform_deliveries = true
#config.action_mailer.raise_delivery_errors = false
#config.action_mailer.default :charset => "utf-8"
#config.action_mailer.smtp_settings = {
#  address: "smtp.gmail.com",
#  port: 587,
#  domain: "it2.herokuapp.com",
#  authentication: "plain",
#  enable_starttls_auto: true,
#  user_name: ENV["GMAIL_USERNAME"],
#  password: ENV["GMAIL_PASSWORD"]
#}
  
 
 ActionMailer::Base.default_url_options[:host] = "localhost:3000"
 Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
