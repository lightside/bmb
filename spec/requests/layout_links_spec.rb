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
		click_link "Contact"
		response.should have_selector('title', :content => "Contact")
		click_link "Account"
		response.should have_selector('title', :content => "Sign Up")
		click_link "Terms of Use"
		response.should have_selector('title', :content => "Terms of Use")
		click_link "Privacy Policy"
		response.should have_selector('title', :content => "Privacy Policy")
		click_link "Home"
		response.should have_selector('title', :content => "")
	end
end
