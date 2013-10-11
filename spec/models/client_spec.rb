require 'spec_helper'

describe Client do
  
  before(:each) do
    
    @attr = { :nom =>"tanguy", 
              :prenom=>"gux", 
              :email=>"test@test.de",
              :entreprise=>"testen", 
              :telephone=> "344343244332",
              :password => "foobar",
              :password_confirmation => "foobar"
            }
  end
  
  it "devrait cree une nouvelle instance avec des attribut valides" do
    Client.create!(@attr)
  end
  
  it "exige un nom" do
     bad_client = Client.new(@attr.merge(:nom=> ""))
     bad_client.should_not be_valid
  end
  
  it "exige un prenom" do
    bad_client = Client.new(@attr.merge(:prenom=> ""))
    bad_client.should_not be_valid
 end
 
 it "exige une entreprise" do
   bad_client = Client.new(@attr.merge(:entreprise=>""))
 end
  
  it "devrait rejeter les noms trop long" do
    long_nom= "a" * 40
    long_nom_client = Client.new(@attr.merge(:nom => long_nom))
    long_nom_client.should_not be_valid
  end
  
  it "devrait rejeter les prenoms trop long" do
    long_prenom= "a" * 40
    long_prenom_client = Client.new(@attr.merge(:prenom => long_prenom))
    long_prenom_client.should_not be_valid
  end
  
  
  it "devrait rejeter les noms pour entreprise trop long" do
    long_nom_entreprise= "a" * 40
    long_nom_entreprise_client = Client.new(@attr.merge(:entreprise => long_nom_entreprise))
    long_nom_entreprise_client.should_not be_valid
  end
  
  it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com THE_USER@foo.bar.com first.last@foo.jp]
    adresses.each do |address|
    valid_email_client = Client.new(@attr.merge(:email=>address))
    valid_email_client.should be_valid
      end
    end
   
   it "devrait rejeter une adresse email invalid" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
    invalid_email_client = Client.new(@attr.merge(:email=>address))
    invalid_email_client.should_not be_valid
     end
   end
   
   it "devrait rejeter un email double" do
    #place un client avec un email donne dans la base de donne
    Client.create!(@attr)
    client_with_duplicate_email = Client.new(@attr)
    client_with_duplicate_email.should_not be_valid
   end
   
   it "devrait rejeter une adresse email invalid a la case" do
    upcased_email = @attr[:email].upcase
    Client.create!(@attr.merge(:email => upcased_email))
    client_with_duplicate_email = Client.new(@attr)
    client_with_duplicate_email.should_not be_valid
   end
   
   
describe "password validations" do
     
     it "devrait exiger un mot de passe" do
       Client.new(@attr.merge(:password=>"", :password_confirmation=>"")).
       should_not be_valid
     end
     
     it "devrait exiger une confirmation de mot de passe qui coreespond" do
       Client.new(@attr.merge(:password_confirmation =>"invalid")).
       should_not be_valid
     end
     
     it "devrais rejeter les mot de passe trop court" do
       short= "a" * 5
       hash = @attr.merge(:password=> short, :password_confirmation=> short)
       Client.new(hash).should_not be_valid
     end
     
     it "devrait rejter les mot de passe trop long"do
     long = "a" * 41
     hash = @attr.merge(:password=>long, :password_confirmation=>long)
     Client.new(hash).should_not be_valid
    end
end # ende  passsword validations
 
 
  describe "password encryption" do
       
       before(:each) do
          @client = Client.create!(@attr)
       end
       
       it "devrait avoir un attribut mot de passe crypte" do
         @client.should respond_to(:encrypted_password)
       end
       
       it "devrait definir le mot de passe crypte" do
         @client.encrypted_password.should_not be_blank
       end
       
    describe "methode has_password" do
         
            it "doit retourner true si les mots de passe coincident" do
               @client.has_password?(@attr[:password]).should be_true
            end
         
            it "doit retourner false si les mots de passe divergent" do
            @client.has_password?("invalide").should be_false   
           end
         
       end #end methode has_password
     
  describe "authenticate method" do
        
        it "devrait retourner nul en cas d'inequation entre email/mot de passe" do
          wrong_password_client = Client.authenticate(@attr[:email], "wrongpass")
          wrong_password_client.should be_nil
        end
        
        it "devrait retourner nil quant eamil ne correspond a aucun utilisatuer " do
          nonexistent_client = Client.authenticate("bar@foo.com", @attr[:password])
          nonexistent_client.should be_nil
        end
        
        it "devrais retourner l'utilisateur si email/mot de passe correspondent" do
          matching_client = Client.authenticate(@attr[:email], @attr[:password])
          matching_client.should == @client
        end
    
     end   # end methode authenticate
       
  end   #end password encryption
  
   describe "les associations au projet" do
     
     before(:each) do 
       @client = Client.create(@attr)
       @mp1 = Factory(:project, :client => @client, :created_at => 1.day.ago )
       @mp2 = Factory(:project, :client => @client, :created_at => 1.hour.ago )
     end
     
     it "devrait avoir un attribut 'projects'" do 
       @client.should respond_to(:projects)
     end
     
     it "devrait avoi les bon projet dans le bon odre" do 
       @client.projects.should == [@mp2, @mp1]
     end
     
     it "devrais detruire les projet associe" do 
       @client.destroy
       [@mp1, @mp2].each do |project|
         Project.find_by_id(project.id).should be_nil
       end
     end
     
    end    #ende associations au projet
  
 
  end
