class PagesController < ApplicationController
  def home
    @titre = "Accueil"
   # @slide_photos = galerie.find(:all, :conditions => {:on => true}, :order => :priority)
  end

  def site
    @titre="Site Web"
  end

  def responsive
    @titre = "Responsive Web"
  end

  def ecommerce
    @titre = "eCommerce"
  end

  def aide
    @titre = "Aide"
  end

  def contact
    @titre = "Contact"
   # @message = Message.new
    
  end
  
  def carriere
    @titre = "Carriere"
  end
  
  def effect
    
  end
  
   
  
 end
