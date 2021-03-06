class UsersController < ApplicationController
  SECRET_KEY = "supersecret".freeze

  def create
    @user = User.new(user_params)

    if @user.save
      render "show", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @users = User.page(params[:page] || 1)
    @pagination = {
      first: @users.first_page?,
      last: @users.last_page?,
      prev: @users.prev_page,
      next: @users.next_page
    }
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    head :unauthorized unless token_is_valid?
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def token_is_valid?
    request.headers[:secretkey] == SECRET_KEY
  end
end
