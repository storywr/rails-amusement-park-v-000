class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :tickets, :height, :nausea, :admin)
  end

end
