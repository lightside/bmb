require 'spec_helper'

describe Listing do
	
	before(:each) do
		@user = Factory(:user)
		@attr = {
			:title => "value for title",
			:content => "value for content",
			:condition => "value for condition",
			:price => "value for price",
			:active => "value for active"
		}
	end
	
	it "should create a new instance given valid attributes" do
		@user.listings.create!(@attr)
	end
	
	describe "user associations" do
	
		before(:each) do
			@listing = @user.listings.create(@attr)
		end
		
		it "should have a user attribute" do
			@listing.should respond_to(:user)
		end
		
		it "should have the right associated user" do
			@listing.user_id == @user.id
			@listing.user.should == @user
		end
	end
	
	describe "book associations"
	
	describe "listing associations" do
	
		before(:each) do
			@user = User.create(@attr)
		end
		
		it "should have a listings attribute" do
			@user.should respond_to(:listings)
		end
	end
	
	describe "validations" do
	
		it "should require a user id" do
			Listing.new(@attr).should_not be_valid
		end
		
		it "should require nonblank title"
		
		it "should reject long title"
		
		it "should require nonblank content" do
			@user.listings.build(:content => "  ").should_not be_valid
		end
		
		it "should reject long content" do
			@user.listings.build(:content => "a" * 251).should_not be_valid
		end
		
		it "should reject invalid price"
	end
end
