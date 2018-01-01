class UsersController < ApplicationController

  before_action :require_logged_out

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Success! Welcome to 99Cats, #{@user.username}!'
      log_in!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end