require 'spec_helper'

describe PagesController do
	render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
    	get 'home'
    	response.should have_selector("title", :content => "Black Market Books")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    it "should have the right title" do
    	get 'contact'
    	response.should have_selector("title", :content => "Black Market Books")
    end
  end
  
  describe "GET 'search'" do
  	it "should be successful" do
  		get 'search'
  		response.should be_success
  	end
    
    it "should have the right title" do
    	get 'search'
    	response.should have_selector("title", :content => "Black Market Books")
    end
  end
end
