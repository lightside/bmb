require 'spec_helper'

describe PagesController do
	render_views
	
	before(:each) do
		@base_title = "Black Market Books"
	end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
    	get 'home'
    	response.should have_selector("title", :content => @base_title)
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    it "should have the right title" do
    	get 'contact'
    	response.should have_selector("title", :content => @base_title)
    end
  end
  
  describe "GET 'search'" do
  	it "should be successful" do
  		get 'search'
  		response.should be_success
  	end
    
    it "should have the right title" do
    	get 'search'
    	response.should have_selector("title", :content => @base_title)
    end
  end
  
  describe "GET 'help'" do
  	it "should be successful" do
  		get 'help'
  		response.should be_success
  	end
  	
  	it "should have the right title" do
  		get 'search'
  		response.should have_selector("title", :content => @base_title)
  	end
  end
  
  describe "GET 'terms'" do
  	it "should be successful" do
  		get 'terms'
  		response.should be_success
  	end
  	
  	it "should have the right title" do
  		get 'terms'
  		response.should have_selector("title", :content => @base_title)
  	end
  end
  
  describe "GET 'privacy'" do
  	it "should be successful" do
  		get 'privacy'
  		response.should be_successful
  	end
  	
  	it "should have the right title" do
  		get 'privacy'
  		response.should have_selector("title", :content => @base_title)
  	end
  end
end
