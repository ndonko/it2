class ClientMailer < ActionMailer::Base

default :from => "papandonko@gmail.com"

  def registration_confirmation(client)
    @client = client
   # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{client.nom} <#{client.email}>", :subject => "Registered")

end

 def password_reset(client)
    @client = client
   # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{client.nom} <#{client.email}>", :subject => "Password reset")

end

end