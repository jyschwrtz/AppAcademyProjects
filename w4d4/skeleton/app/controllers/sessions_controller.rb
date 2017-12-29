class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Username and password combination is invalid."]
      render :new
    else
      log_in!(user)
      redirect_to cats_url
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

end
