class ApplicationController < ActionController::Base

layout 'home'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_url, notice: "You are not authorized to access this area."
	end

	before_filter :set_global_search_variable

	def set_global_search_variable
		@q = Listing.search(params[:q])
	end


end
