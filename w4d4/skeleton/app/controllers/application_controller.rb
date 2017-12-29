class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_user_is_owner?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user
  end

  def logged_in?
    !!current_user
  end

  def log_in!(user)
    session[:session_token] = user.session_token
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_logged_out
    if logged_in?
      redirect_to cats_url
    end
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_only_owner_approves
    current_request = CatRentalRequest.find_by(id: params[:id])
    current_cat = current_user.cats.find_by(id: current_request[:cat_id])

    if current_cat.nil?
      redirect_to cat_url(current_request[:cat_id])
    end

  end

  def require_is_this_my_owner
    current_cat = current_user.cats.find_by(id: params[:id])
    if current_cat.nil?
      redirect_to cat_url(params[:id])
    end
  end

  def current_user_is_owner?
    !!current_user.cats.find_by(id: params[:id])
  end

  # private

  # def current_session
  #   session[:session_token]
  # end
  #
  # def current_session=(value)
  #   session[:session_token] = value
  # end
end
