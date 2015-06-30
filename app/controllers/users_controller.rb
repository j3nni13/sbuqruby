class UsersController < ApplicationController
def create
  @user = User.new(params[:user])
  if @user.save
    flash[:notice] = "Successfully created user."
    if params[:user][:avatar].blank?
      redirect_to @user
    else
      render :action => 'crop'
    end
  else
    render :action => 'new'
  end
end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    flash[:notice] = "Successfully updated user."
    if params[:user][:avatar].blank?
      redirect_to @user
    else
      render :action => 'crop'
    end
  else
    render :action => 'edit'
  end
end

end
