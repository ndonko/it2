class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    #message.to = "panytanguy6@yahoo.fr"
  end
end

