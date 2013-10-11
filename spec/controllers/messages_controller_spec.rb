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

describe MessagesController do
   render_views
   
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

 # describe "GET 'show'" do
  #  it "returns http success" do
   #   get 'show'
    #  response.should be_success
   # end
  #end

   describe "POST 'create'" do
     before(:each) do
       @message = { :nom => "", 
                    :prenom => "", 
                    :entreprise => "", 
                    :lieu     => "",
                    :telephone => "",
                    :email    => "",
                    :message => ""
                     }
     end
     
     it "devrais pas cree un message" do
        lambda do
          post :create, :message => @message
        end.should_not change(Message, :count)
      end
     
     it "devrais avoir le bon titre" do
       post :create, :message => @attr
       response.should have_selector("title", :content => "Inscription")
     end
     
     it "devrais rendre la page 'formulaire_message'" do
        post :create, :message => @attr
        response.should render_template('formulaire_message')
     end
     
    # it "devrait avoir un message" do
     #     post :create, :message => @attr
      #    flash[:success].should =~ /message transmis/i
       # end
     
   end



end
