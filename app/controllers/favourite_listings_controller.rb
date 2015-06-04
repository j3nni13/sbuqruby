class FavouriteListingsController < ApplicationController
before_action :set_listing
  
  def create
    if Favourite.create(favourited: @listing, user: current_user)
      redirect_to @listing, notice: 'Listing has been favorited'
    else
      redirect_to @listing, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favourite.where(favourited_id: @listing.id, user_id: current_user.id).first.destroy
    redirect_to @listing, notice: 'Listing is no longer in favorites'
  end
  
  private
  
  def set_listing
    @listing = Listing.find(params[:listing_id] || params[:id])
  end
end
