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
  	@title = "Help"
  end
end
