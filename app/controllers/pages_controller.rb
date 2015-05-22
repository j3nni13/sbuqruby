class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]


  def dashboard
  	@listings = current_user.listings
  end

  def adminlistings
  	@listings = current_user.listings
  end

def index
   @search = Listing.search(params[:q])
   @listings  = @search.result 
   
end
  
private
    def search
      if params[:q]
        search_params = CGI::escapeHTML(params[:q]) 
        redirect_to ("/listings")
      end
    end  
    
end
