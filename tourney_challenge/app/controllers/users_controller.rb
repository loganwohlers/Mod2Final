class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to teams_path
    else
      flash[:messages] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
