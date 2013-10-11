class ProjectsController < ApplicationController
   before_filter :authenticate, :only => [:create, :destroy]
  def new
   @projet = Project.new
   end
   
   def create
     @projet= current_client.projects.build(params[:project])
     if @projet.save
       flash[:success] = "Projet enregistre"
       redirect_to new_project_path
     else
       render 'projects/new'
     end
     
     end
   
   def destroy
     
   end
  
  
   
end
