class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
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
