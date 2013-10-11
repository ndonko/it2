require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
    @base_title = "It2Solutions"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "doit avoir le bon titre" do
       get 'home'
       response.should have_selector("title", :content => @base_title + " | Accueil")
     end
    
  end

  describe "GET 'site'" do
    it "should be successful" do
      get 'site'
      response.should be_success
    end
    
    it "doit avoir le bon titre" do
       get 'site'
       response.should have_selector("title", :content => @base_title + " | Site Web")
     end
    
  end

  describe "GET 'responsive'" do
    it "should be successful" do
      get 'responsive'
      response.should be_success
    end
    
    it "doit avoir le bon titre" do
       get 'responsive'
       response.should have_selector("title", :content => @base_title + " | Responsive Web")
     end
    
  end

  describe "GET 'ecommerce'" do
    it "should be successful" do
      get 'ecommerce'
      response.should be_success
    end
    
    it "doit avoir le bon titre" do
       get 'ecommerce'
       response.should have_selector("title", :content => @base_title + " | eCommerce")
     end
   end

  describe "GET 'aide'" do
    it "should be successful" do
      get 'aide'
      response.should be_success
    end
    
    it "doit avoir le bon titre" do
       get 'aide'
       response.should have_selector("title", :content => @base_title + " | Aide")
     end
    
  end

  #describe "GET 'contact'" do
   # it "should be successful" do
    #  get 'contact'
     # response.should be_success
    #end
    #it "doit avoir le bon titre" do
    #   get 'contact'
     #  response.should have_selector("title", :content => @base_title + " | ")
     #end
    
  #end

  describe "GET 'carriere'" do
    it "should be successful" do
      get 'carriere'
      response.should be_success
    end
    
    it "doit avoir le bon titre" do
       get 'carriere'
       response.should have_selector("title", :content => @base_title + " | Carriere")
     end
    
  end

end
