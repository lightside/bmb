class PagesController < ApplicationController
  
  def home
  	@title = "Home"
  	if signed_in?
  		@listing = Listing.new
  		@feed_items = current_user.feed.paginate(:page => params[:page])
  	end
  end

  def contact
  	@title = "Contact"
  end
  
  def search
  	@title = "Search"
  end
  
  def help
  	@title = "FAQ"
  end
  
  def terms
  	@title = "Terms of Use"
  end
  
  def privacy
  	@title = "Privacy Policy"
  end
end
