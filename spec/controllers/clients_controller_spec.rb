require 'spec_helper'

describe ClientsController do
  render_views
  
   describe "GET 'show'" do
      
      before(:each) do
        @client = Factory(:client)
     end
      
      it "devrait reussir" do
        
        get 'show', :id => @client
        response.should be_success
      end
      
      it "devrait trouver le bon utilisateur" do
        #get :show, :id => @client
        #assigns(:client).should == @client
      end
      
      it "devrait avoir le bon titre" do
        #get :show, :id => @client
        #response.should have_selector("title", :content => @client.nom)
      end
      
      it "devrait inclure le nom du client" do
        #get :show, :id => @client
        #response.should have_selector("h1", :content => @client.nom)
      end
      
      it "devrai avoir une image de profil" do
        #get :show, :id => @client
        #response.should have_selector("h1>img", :class => "gravatar")
      end
      
      it "devrais afficher les projet du cleint" do 
        mp1 = Factory(:project, :client => @client, :question1 =>"foo barr", :question2=>"foo bar")
        mp2 = Factory(:project, :client => @client, :question2 =>"foo barr", :question2=>"foo bar")
        get :show, :id => @client
        response.should have_selector("span.content", :question1 => mp1.question1)
        response.should have_selector("span.content", :question1 => mp2.question1)
      end
      
    end
  
  
  describe "GET 'new'" do
  
    it "devrait reussir" do
      get :new
      response.should be_success
    end
    
    it "devrait avoir le bon titre" do
      get :new
      response.should have_selector("title", :content => "enregistrement")
    end
  end
    
   
    
    
    describe "POST 'create'" do
      
      describe "echec" do
      
        before(:each) do
          @attr = { :nom => "", 
                    :prenom => "", 
                    :email=> "", 
                    :entreprise => "", 
                    :telephone => "", 
                    :password => "", 
                    :password_confirmation => ""
                  } 
        end
        
        it "ne devrait pas creer de client" do
          lambda do
            post :create, :client => @attr
          end.should_not change(Client, :count)
        end
        
        it "devrait avoir le bon titre" do
        post :create, :client => @attr
        response.should have_selector("title", :content => "enregistrement")
      end
      
      it "devrait rendre la page 'new'" do
        post :create, :client => @attr
        response.should render_template('new')
      end
        
      end
      
      
        
        describe "succes" do
          
          before(:each) do
          @attr = { :nom => "Ndonko", 
                    :prenom => "Tanguy", 
                    :email=> "tanguy@tanguy.fr", 
                    :entreprise => "it2", 
                    :telephone => "44748748742", 
                    :password => "pepekale", 
                    :password_confirmation => "pepekale"
                  } 
        end
        
        it "devrait creer un utilisateur" do
        lambda do
          post :create, :client => @attr
        end.should change(Client, :count).by(1)
      end
      
      it "devrait rediriger vers la page d'affichage de l utilisateur" do
        post :create, :client => @attr
        response.should redirect_to(client_path(assigns(:client)))
      end    
        
        it "devrait avoir un message de bienvenu" do
          post :create, :client => @attr
          flash[:success].should =~ /Bienvenue dans votre espace client/i
        end
        
        it "devrait identifier l'utilisateur" do
        post :create, :client => @attr
        controller.should be_signed_in
      end
        
       
        
      end
      
    end
    
end
