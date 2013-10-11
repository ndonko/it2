class SessionsController < ApplicationController
  def new
    @titre = "Identification"
  end
  
  def create
    
  client = Client.authenticate(params[:session][:email],params[:session][:password])
  if client #&& client.authenticate(params[:session][:password])
    if params[:remember_me]
      cookies.permanent[:auth_token] = client.auth_token
    else
      cookies[:auth_token] = client.auth_token
    end
    #redirect_to root_url, :notice => "Logged in!"
       sign_in client
       redirect_to client
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
    
   # client = Client.authenticate(params[:session][:email],params[:session][:password])
    #  if client.nil?
     # flash.now[:error] = "Combinaison Email/Mot de passe invalide."
      #@titre = "S'identifier"
      #render 'new'
   #else
    #   sign_in user
     #  redirect_to user
  #end
end 
 
    
    
   
  
  def destroy
    cookies.delete(:auth_token)
    sign_out
    redirect_to root_path
  end
  
  
end
