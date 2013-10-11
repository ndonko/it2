class PasswordResetsController < ApplicationController
  def new
  end
  

def create
  client = Client.find_by_email(params[:email])
  client.send_password_reset if client
  redirect_to root_path, :notice => "Email sent with password reset instructions."
end

def edit
  @client = Client.find_by_password_reset_token!(params[:id])
end

def update
  @client = Client.find_by_password_reset_token!(params[:id])
  if @client.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "Password reset has expired."
  elsif @client.update_attributes(params[:user])
    redirect_to root_url, :notice => "Password has been reset!"
  else
    render :edit
  end
end


  
  
  
  
end
