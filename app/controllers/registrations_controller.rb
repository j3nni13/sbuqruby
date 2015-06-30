class RegistrationsController < Devise::RegistrationsController

  layout 'nofoot'

def update
    @user = User.find(current_user.id)
    # binding.pry
    successfully_updated = if params[:user][:password].present?
        @user.update_with_password(account_update_params)
        # binding.pry
      else
        # params[:user][:password] not present aka not updating password and therefore don't need current_password
        # binding.pry
        params[:user].delete("current_password")
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
        @user.update_without_password(account_update_params)
      end

      if successfully_updated
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case his password changed
        sign_in @user, :bypass => true
        if params[:user][:avatar].blank?
          redirect_to edit_user_registration_path(@user)
        else
          render :action => "crop"
        end
      else
        render "edit"
      end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end