class ClientsController < ApplicationController
  
 # before_filter :authenticate, :only => [:show]
 # before_filter :correct_client, :only => [:show]
  
  def show
    @client = Client.find(params[:id])
    @projects = @client.projects.paginate(:page => params[:page])
    @titre = @client.nom
  end
  
  def new
   @client = Client.new
   @titre = "enregistrement"
  end
  
  def create
       @client = Client.new(params[:client])
    if @client.save
      #ClientMailer.registration_confirmation(@client).deliver
      sign_in @client
      flash[:success] = "Bienvenue dans votre espace client"
      redirect_to @client 
      
      ClientMailer.registration_confirmation(@client).deliver
    else
      @titre= "enregistrement"
      render 'new'
      end
      
      
      
    end
    
    
    private
    
    #def authenticate
     # deny_access unless signed_in?
    #end
    
     def correct_client
       @client=Client.find(params[:id])
       redirect_to(root_path) unless current_client?(@client)
     end
  
end
