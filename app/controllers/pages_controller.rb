class PagesController < ApplicationController
  
  def home
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
