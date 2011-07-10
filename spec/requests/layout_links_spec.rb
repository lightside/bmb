require 'spec_helper'

describe "LayoutLinks" do

	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "")
	end 
	
	it "should have a Contact page at '/contact'" do
		get '/contact'
		response.should have_selector('title', :content => "Contact")
	end
	
	it "should have a Search page at '/search'" do
		get '/search'
		response.should have_selector('title', :content => "Search")
	end
	
	it "should have a Help page at '/help'" do
		get '/help'
		response.should have_selector('title', :content => "FAQ")
	end
	
	it "should have a Terms of Use page at '/terms'" do
		get '/terms'
		response.should have_selector('title', :content => "Terms of Use")
	end
	
	it "should have a Privacy Policy page at '/privacy'" do
		get '/privacy'
		response.should have_selector('title', :content => "Privacy Policy")
	end
	
	it "should have a Sign Up page at '/signup'" do
		get '/signup'
		response.should have_selector('title', :content => "Sign Up")
	end
	
	it "should have the right links on the layout" do
		visit root_path
		click_link "Search"
		response.should have_selector('title', :content => "Search")
		click_link "FAQ"
		response.should have_selector('title', :content => "FAQ")
		click_link "Sign In"
		response.should have_selector('title', :content => "Sign In")
		click_link "Terms of Use"
		response.should have_selector('title', :content => "Terms of Use")
		click_link "Privacy Policy"
		response.should have_selector('title', :content => "Privacy Policy")
		click_link "Home"
		response.should have_selector('title', :content => "")
	end
	
	describe "when not logged in" do
	
		it "should have a login link" do
			visit root_path
			response.should have_selector("a", :href => login_path, :content => "Sign In")
		end
	end
	
	describe "when logged in" do
	
		before(:each) do
			@user = Factory(:user)
			integration_sign_in(@user)
		end
		
		it "should have a logout link" do
			visit root_path
			response.should have_selector("a", :href => logout_path, :content => "Sign Out")
		end
		
		it "should have a profile link" do
			visit root_path
			response.should have_selector("a", :href => user_path(@user), :content => "Dashboard")
		end
	end
end
