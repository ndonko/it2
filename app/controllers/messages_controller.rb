class MessagesController < ApplicationController
  def index
    @message = Message.find(:all)
  end

  def show
    @message = Message.find(params[:id])
  end
  
  def formulaire_message
    @message = Message.new
    @titre="Contact" 
  end
 
  def contact
     @titre = "Contact"
  end
  def create
        @message = Message.new(params[:message])
   if @message.save
      flash[:success] = "message transmis"
      #redirect_to  action: ''
      redirect_to  "/contact"
   else
      @titre = "Inscription"
      render 'formulaire_message'
     #  redirect_to  action: 'formulaire_message'
     
   end
end
end
