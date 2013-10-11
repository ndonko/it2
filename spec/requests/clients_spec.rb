#encoding: utf-8
require 'spec_helper'

describe "Clients" do
  
  describe "une inscription" do
    
    describe "raté" do
      
      it "ne devrait pas creer un nouvel utilisateur" do
        lambda do
       visit signup_path
        fill_in "Nom",                   :with => ""
        fill_in "prenom",                :with => ""
        fill_in "email",                :with => ""
        fill_in "entreprise",             :with => ""
        fill_in "telephone",                 :with => ""
        fill_in "password",              :with => ""
        fill_in "confirmation",           :with => ""
        click_button
        response.should render_template('clients/new')
        #response.should have_selector("div#error_explanation")
      end.should_not change(Client, :count)
     end
      
      it "devrait pas creer un nouvel utilisateur" do
        lambda do
       visit signup_path
        fill_in "Nom",                   :with => "toto"
        fill_in "prenom",                :with => "tata"
        fill_in "entreprise",            :with => "test"
        fill_in "telephone",             :with => "1213232132"
        fill_in "email",                 :with => "test@toto.de"
        fill_in "password",              :with => "foobar"
        fill_in "confirmation", :with => "foobar"
        click_button
        response.should render_template('clients/new')
       # response.should have_selector("div#error_explanation")
      end.should change(Client, :count).by(1)
     end
      
      
    end
   end
   
   describe "identification/déconnexion" do

    describe "l'échec" do
      it "ne devrait pas identifier l'utilisateur" do
        visit signin_path
        fill_in "email",    :with => ""
        fill_in "Mot de passe", :with => ""
        click_button
      #  response.should have_selector("div.flash.error", :content => "Invalid")
      end
    end

    describe "le succès" do
      it "devrait identifier un utilisateur puis le déconnecter" do
        client = Factory(:client)
        visit signin_path
        fill_in "email",    :with => client.email
        fill_in "Mot de passe", :with => client.password
        click_button
        controller.should be_signed_in
        click_link "déconnextion"
        controller.should_not be_signed_in
      end
    end
    
    end
end
