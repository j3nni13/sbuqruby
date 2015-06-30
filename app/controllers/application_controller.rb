class ApplicationController < ActionController::Base

layout 'home'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation
  
  private
 
  def mailbox
    @mailbox ||= current_user.mailbox
  end

    def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :gender, :date_of_birth, :avatar, :crop_x, :crop_y, :crop_w, :crop_h) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password, :gender, :date_of_birth, :avatar, :crop_x, :crop_y, :crop_w, :crop_h) }
        end

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_url, notice: "You are not authorized to access this area."
	end

	before_filter :set_global_search_variable

	def set_global_search_variable
		@q = Listing.search(params[:q])
	end


end
