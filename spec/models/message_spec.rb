# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  prenom     :string(255)
#  entreprise :string(255)
#  lieu       :string(255)
#  telephone  :string(255)
#  email      :string(255)
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Message do
  before(:each) do
    @attr = {  :nom => "ndonko", 
               :prenom=> "tanguy", 
               :entreprise => "it2solutions", 
               :lieu => "Douala",
               :telephone => "00237 8934567", 
               :email => "test@test.com", 
               :message => "test message"
             }
  end
  
   it "devrais exiger un nom" do
     bad_guy = Message.new(@attr.merge(:nom => ""))
     bad_guy.should_not be_valid
   end
  
   it "devrais exiger un prenom" do
     bad_guy = Message.new(@attr.merge(:prenom => ""))
     bad_guy.should_not be_valid
   end
   
   it "devrais exiger un nom d'entreprise" do
     bad_guy = Message.new(@attr.merge(:entreprise => ""))
     bad_guy.should_not be_valid
   end
   
   it "devrais exiger un lieu" do
     bad_guy = Message.new(@attr.merge(:lieu => ""))
     bad_guy.should_not be_valid
     
   end
   
   it "devrait accepter un numero valide" do
   
      numero = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
      numero.each do |number|
      valid_numero = Message.new(@attr.merge(:telephone => number ))
      valid_numero.should be_valid
      end    

   end
  
  it "devrais accepter une adresse email valide" do
    
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
      
      valid_email_message = Message.new(@attr.merge(:email => address))
      valid_email_message.should be_valid
    end 
 end
 
 it "devrait rejeter une adresse email invalid" do
   
   adresses = %w[user@foo,com user_at_foo.org example.user@foo. ]
   adresses.each do |address|
     
     invalid_email_message = Message.new(@attr.merge(:email => address))
     invalid_email_message.should_not be_valid
  end
end 

  it "devrais rejeter un email double" do
    #placer un utilisateur avec un email donné dans la BD
    Message.create!(@attr)
    message_with_duplicate_email = Message.new(@attr)
    message_with_duplicate_email.should_not be_valid
  end

  it "devrais rejeter une adresse email invalide a la casse" do
    
    upcased_email = @attr[:email].upcase
    Message.create!(@attr.merge(:email => upcased_email))
    message_with_duplicate_email = Message.new(@attr)
    message_with_duplicate_email.should_not be_valid
  end

end
