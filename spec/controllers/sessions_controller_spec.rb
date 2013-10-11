require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do
    
    it "devrait reussir" do
      get :new
      response.should be_success
    end
    
    it "devrait avoir le bon titre" do
      get :new
      response.should have_selector("title", :content=> "Identification")
    end
    
  end
  
  describe "POST 'create' " do
    
    describe "invalid signin" do
        
        before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end
      
       it "devrait re-rendre la page new" do
        post :create, :session => @attr
        response.should render_template('new')
      end
      
      it "devrait avoir le bon titre" do
        post :create, :session => @attr
        response.should have_selector("title", :content => " ")
      end
      
    it "devait avoir un message flash.now" do
        post :create, :session => @attr
   #     flash.now[:error].should =~ /Invalid email or password/i
      end  
      
    end
    
    describe "avec un email et un mot de passe valides" do
      
      before(:each) do
        @client = Factory(:client)
        @attr = { :email => @client.email, :password => @client.password }
      end

      it "devrait identifier l'utilisateur" do
        post :create, :session => @attr
        controller.current_client.should == @client
        controller.should be_signed_in
      end

      it "devrait rediriger vers la page d'affichage de l'utilisateur" do
        post :create, :session => @attr
        response.should redirect_to(client_path(@client))
      end
      
    end
    
 end
 
      describe "DELETE 'destroy'" do
        
        it "devrait deconnecter un utilisateur" do
          test_sign_in(Factory(:client))
          delete :destroy
          controller.should_not be_signed_in
          response.should redirect_to(root_path)
          
        end
        
      end
  

end
