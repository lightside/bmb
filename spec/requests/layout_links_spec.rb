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
end
