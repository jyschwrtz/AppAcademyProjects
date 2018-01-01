class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user


  def current_user
    return nil unless session[:session_token]
    @current_user = User.find_by(session_token: session[:session_token])
  end

  def log_in(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_moderator
    unless current_user.moderator
      flash[:errors] = ["This action allowed by moderator's only"]
      redirect_to subs_url
    end
  end

end
