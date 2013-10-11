module SessionsHelper
  
  def sign_in(client)
    cookies.permanent.signed[:remember_token] = [client.id, client.salt]
    self.current_client = client
  end
  
 
   def current_client=(client)
     @current_client = client
   end
   
   def current_client
    @current_client ||= client_from_remember_token
    # current_client ||= client_from_remember_token || Client.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    #@current_client ||= Client.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
   end
  
  def signed_in?
    !current_client.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_client = nil
  end

  def current_client?(client)
    client == current_client
  end
  
   def authenticate
      deny_access unless signed_in?
    end

  def deny_access
    redirect_to signin_path, :notice => "Merci de vous identifier pour rejoindre cette page"
  end

  private

    def client_from_remember_token
      Client.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
    
    
    # for user 
  
end
