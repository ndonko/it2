require 'spec_helper'

describe "LayoutLinks" do
  
  describe "GET home" do
   # it "devrait trouver une page home a 'home' " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    # get 'home'
      #response.status.should be(200)
     # response.should have_selector('title', :content => "Accueil")
    #end
  end
  
  describe "GET /pages/contact" do
    #it "devrait trouver une page  a '/pages/contact' " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get '/pages/contact'
      #response.status.should be(200)
     # response.should have_selector('title', :content => "Contact")
    #end
  end
  
  describe "GET /aide" do
    #it "devrait trouver une page  help  a '/help' " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get '/help'
      #response.status.should be(200)
     # response.should have_selector('title', :content => "Aide")
    #end
  end
  
  describe "GET /about" do
    #it "devrait trouver une page  about  a '/about'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get '/about'
      #response.status.should be(200)
      #response.should have_selector('title', :content => " A Propos")
    #end
  end
  
  describe "GET /site" do
    #it "devrait trouver une page  about  a '/site' " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get '/site'
      #response.status.should be(200)
      #response.should have_selector('title', :content => "Site Web")
    #end
  end
  
  describe "GET /responsive" do
    #it "devrait trouver une page  responsive  a '/responsive' " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get '/responsive'
      #response.status.should be(200)
      #response.should have_selector('title', :content => "Responsive Web")
    #end
  end
  
  describe "GET /ecommerce" do
    #it "devrait trouver une page  ecommerce  a '/ecommerce'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get '/ecommerce'
      #response.status.should be(200)
      #response.should have_selector('title', :content => "E-Commerce")
    #end
  end
  
  describe "GET signup" do
    
    #it "devrait trouver une page  new  a '/signup'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get '/signup'
      #response.status.should be(200)
      #response.should have_selector('title', :content => "Inscription")
    #end
  end
  
  describe "quand pas identifier" do
    
    #it "doit voir un lien connection" do
     # visit root_path
      #response.should have_selector("a", :href => signin_path, :content => "espace client")
   # end
    
  end
  
  
   describe "quand identifie" do
     before(:each)  do
       @client = Factory(:client)
       visit signin_path
       fill_in :email,    :with => @client.email
       fill_in "Mot de passe", :with => @client.password
       click_button
    end

    #it "devrait avoir un lien de deconnexion" do
     #  visit root_path
      # response.should have_selector("a", :href => signout_path,
       #                                  :content => "deconnexion")
     #end

  
  
      # describe "quand identifie" do
    
       #   it "devrait avoir un lien vers le profil" do
        #  visit root_path
         # response.should have_selector("a", :href => client_path(@client),
          #                               :content => "Profil")
         #end
       #end
  
  
  end
  end
 
