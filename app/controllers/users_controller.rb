class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  @user = current_user
  @users = User.all
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to authenticated_root_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_path
    end
  end

  def edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

end