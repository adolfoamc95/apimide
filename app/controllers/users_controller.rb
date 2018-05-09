class UsersController < ApplicationController
  before_action :authenticate!
  
  def create_params
    params.require(:user).permit(name, :email, :password)
  end

  def create
    @user = User.new(create_params)
    if @user.save
      render json: @user.as_json(representation: :basic)

    else
      render json: @user.errors, status: 422
    end
  end

  def index
    @users = User.all
    render json: @users.as_json(representation: :basic)
  end
end
