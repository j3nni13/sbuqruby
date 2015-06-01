class ApplicationController < ActionController::Base

layout 'home'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password, :gender, :date_of_birth, :avatar) }
        end

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_url, notice: "You are not authorized to access this area."
	end

	before_filter :set_global_search_variable

	def set_global_search_variable
		@q = Listing.search(params[:q])
	end


end
