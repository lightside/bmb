require 'spec_helper'

describe ListingsController do
	render_views
	
	describe "access control" do
	
		it "should deny access to 'create'" do
			post :create
			response.should redirect_to(login_path)
		end
		
		it "should deny access to 'destroy'" do
			delete :destroy, :id => 1
			response.should redirect_to(login_path)
		end
	end
	
	describe "POST 'create'" do
	
		before(:each) do
			@user = test_sign_in(Factory(:user))
		end
		
		describe "failure" do
		
			before(:each) do
				@attr = { :title => "", :content => "", :condition => "", :price => "", :active => "" }
			end
			
			it "should not create a micropost" do
				lambda do
					post :create, :listing => @attr
				end.should_not change(Listing, :count)
			end
			
			it "should render the home page" do
				post :create, :listing => @attr
				response.should render_template('pages/home')
			end
		end
		
		describe "success" do
		
			before(:each) do
				@attr = { :title => "Test post", :content => "Lorem ipsum", :condition => "good", :price => "$00.00", :active => "true" }
			end
			
			it "should create a listing" do
				lambda do
					post :create, :listing => @attr
				end.should change(Listing, :count).by(1)
			end
			
			it "should redirect to the home page" do
				post :create, :micropost => @attr
				flash[:success].should =~ /listing create/i
			end
		end
	end
	
	describe "DELETE 'destroy'" do
	
		describe "for an unauthorized user" do
		
			before(:each) do
				@user = Factory(:user)
				wrong_user = Factory(:user, :email => Factory.next(:email))
				test_sign_in(wrong_user)
				@listing = Factory(:listing, :user => @user)
			end
			
			it "should deny access" do
				delete :destroy, :id => @listing
				response.should redirect_to(root_path)
			end
		end
		
		describe "for an authorized user" do
		
			before(:each) do
				@user = test_sign_in(Factory(:user))
				@listing = Factory(:listing, :user => @user)
			end
			
			it "should destroy the listing" do
				lambda do
					delete :destroy, :id => @listing
				end.should change(Listing, :count).by(-1)
			end
		end
	end
end
