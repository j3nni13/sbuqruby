class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]


  def dashboard
  	@listings = current_user.listings
    render(:layout => 'layouts/nofoot')
  end

  def dminlistings
  	@listings = current_user.listings
    render(:layout => 'layouts/nofoot')
  end

   def favourites
    @listings = current_user.favourite_listings
    render(:layout => 'layouts/nofoot')
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
