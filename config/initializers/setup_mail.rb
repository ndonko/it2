#require 'development_mail_interceptor'
#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.default  :charset => "utf-8" 
 #ActionMailer::Base.smtp_settings = {
 #  :address                => "smtp.gmail.com",
 #  :port                   => 587,
 #  :domain                => "gmail.com",
 #  :user_name              => "papandonko@gmail.com",
 #  :password               => "pany19tanguy84",
 #  :authentication         => "plain",
 #  :enable_starttls_auto   => true
 #}
 
  
  
 
# ActionMailer::Base.default_url_options[:host] = "localhost:3000"
 #Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
