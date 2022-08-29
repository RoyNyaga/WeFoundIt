class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    @account_missing_items = @user.missing_items
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your account."
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :phone, :avatar, :region, :city)
  end
end
