class UsersController < ApplicationController
  def create_params
    params.require(:user).permit(:name, :email)
  end

  def create
    @user = User.new(create_params)
    if @user.save
      render json: @user

    else
      render json: @user.errors, status: 422
    end
  end

  def index
    @users = User.all
    render json: @users
  end
end
