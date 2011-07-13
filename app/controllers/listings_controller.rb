class ListingsController < ApplicationController
	before_filter :authenticate
	before_filter :authorized_user, :only => :destroy
	
	def create
		@listing = current_user.listings.build(params[:listing])
		if @listing.save
			flash[:success] = "Listing created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'pages/home'
		end
	end
	
	def destroy
		@listing.destroy
		redirect_back_or root_path
	end
	
	private
	
		def authorized_user
			@listing = current_user.listings.find_by_id(params[:id])
			redirect_to root_path if @listing.nil?
		end
end
