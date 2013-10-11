require 'spec_helper'

describe ProjectsController do
  render_views

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
  
  
  describe "controle acces" do 
    it "devrais refuser l'acces pour 'create' " do 
      post :create
      response.should redirect_to(signin_path)
    end
    
    it "devrait refuser l'acces pour 'destroy'" do 
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
    
    
  end
  
  
  describe "POST 'create'" do 
    
    before(:each) do 
      @client = test_sign_in(Factory(:client))
    end
    
    describe "echec" do 
      before(:each) do 
        @attr = {:question1 => "", 
                 :question2=> ""
                 :question3 => "", 
                 :question4 => "", 
                 :question5 => "", 
                 :question6 => "", 
                 :question7 => "", 
                 :question8 => "", 
                 :question9 => "", 
                 :question10 => "", 
                 :question11 => "", 
                 :question12 => "", 
                 :question13 => "", 
                 :question14 => "", 
                 :question15 => "", 
                 :question16 => "", 
                 :question17 => "", 
                 :question18 => "", 
                 :question19 => "", 
                 :question20 => "", 
                 :question21 => "", 
                 :question22 => "", 
                 :question23 => "", 
                 :question24 => "",
                 :question25 => "", 
                 :question26 => "", 
                 :question27 => "", 
                 :question28 => "", 
                 :question29 => "", 
                 :question30 => "", 
                 }
      end
      
      it "devrais pas cree un projet" do 
        lambda do 
          post :create, :project => @attr
        end.should_not change(Project, :count)
      end
      
      it "devrais retrourner la page d'accueil" do 
         post :create, :project => @attr
         response.should render_template('pages/home')
      end
    end  #ende describe echec
    
      describe "succes" do 
        
        before(:each) do 
          @attr = { :question1 => "Lorem ipsum", :question2=> "Lorem ipsum",
                    :question3 => "Lorem ipsum", :question4 => "Lorem ipsum",
                    :question5 => "Lorem ipsum", :question6 => "Lorem ipsum",
                    :question7 => "Lorem ipsum", :question8 => "Lorem ipsum",
                     :question9 => "Lorem ipsum", :question10 => "Lorem ipsum",
                      :question11 => "Lorem ipsum", :question12 => "Lorem ipsum",
                       :question13 => "Lorem ipsum", :question14 => "Lorem ipsum",
                        :question15 => "Lorem ipsum", :question16 => "Lorem ipsum",
                         :question17 => "Lorem ipsum", :question18 => "Lorem ipsum",
                          :question19 => "Lorem ipsum", :question20 => "Lorem ipsum",
                           :question21 => "Lorem ipsum", :question22 => "Lorem ipsum",
                            :question23 => "Lorem ipsum", :question24 => "Lorem ipsum",
                             :question25 => "Lorem ipsum", :question26 => "Lorem ipsum",
                              :question27 => "Lorem ipsum", :question28 => "Lorem ipsum",
                               :question29 => "Lorem ipsum", :question30 => "Lorem ipsum",
                               
               }
        end
        
        it "devrais creer un projet" do 
          lambda do 
            post :create, :project => @attr
          end.should change(Project, :count).by(1)
        end
        
        it "devrais rediriger vers la page d'accueil" do 
          post :create, :project => @attr
          response.should redirect_to root_path
        end
        
        it "devrait rediriger ver la page d'accueil"  do 
          post :create, :project => @attr
          response.should redirect_to(root_path)
        end
        
        it "devrait avoir  un message flash" do 
          post :create, :project => @attr
          flash[:success].should =~ /projet enregistre/i
        end
        
      end  # end describe succes
    
  end  # end post create
  

end
