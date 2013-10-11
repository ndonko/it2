class ResetClientMailer < ActionMailer::Base
  default :from => "papandonko@gmail.com"

  def password_reset(client)
    @client = client
   # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{client.nom} <#{client.email}>", :subject => "Password reset")

end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reset_client_mailer.password_reset.subject
  #
 # def password_reset(client)
  #  @client= client

   # mail to: => client.email, :subject => "Password Reset"
  #end
end
