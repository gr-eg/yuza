class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render "show", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
