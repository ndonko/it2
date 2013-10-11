require 'spec_helper'

describe Project do
   before(:each) do 
     @client = Factory(:client)
     @attr = {
       :question1 => "value of question",
       :question2 => "value of question"
       }
    end
    
    it "devrait creer une nouvelle instance avec les attributs valides" do 
       @client.projects.create!(@attr)   
    end
       
    describe "association avec le client" do
      
      before(:each) do
        @projet = @client.projects.create(@attr)
      end
      
      it "devrait avoir un attribut client" do 
        @projet.should respond_to(:client)
      end
      
      it "devrait avoir le bon client associe" do 
        @projet.client_id.should == @client.id
        @projet.client.should == @client
      end
      
    end   # end association avec le client
  
   describe "validations" do 
     
     it "requiert un identifaint d'utilisateur" do 
       Project.new(@attr).should_not be_valid
     end
     
     it " question1 requiert un contenu non vide" do 
       @client.projects.build(:question1 => " ").should_not be_valid
     end
     
      it " question2 requiert un contenu non vide" do 
       @client.projects.build(:question2 => " ").should_not be_valid
     end
     
     it " question1 devrait rejeter un contenu trop long" do 
      @client.projects.build(:question1 => "a" * 141).should_not  be_valid  
     end
     
     it " question2 devrait rejeter un contenu trop long" do 
      @client.projects.build(:question2 => "a" * 141).should_not  be_valid  
     end
     
     
     
   end
  
  
end    #end describe project
