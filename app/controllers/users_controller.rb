class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to user_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

end