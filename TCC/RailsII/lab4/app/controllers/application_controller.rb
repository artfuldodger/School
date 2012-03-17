class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to new_user_url, alert: 'You must be logged in to access this area.' unless current_user
  end

  helper_method :current_user, :require_user
end
