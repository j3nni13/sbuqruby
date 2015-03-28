class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  def home
  end
  	

  def dashboard
  	@listings = current_user.listings
  end

  def adminlistings
  	 	@listings = current_user.listings
  end

end
