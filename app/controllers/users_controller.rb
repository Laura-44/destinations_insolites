class UsersController < ApplicationController
  def show
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.requite(:user).permit(:first_name, last_name, address, email, password)
  end
end
