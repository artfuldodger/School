class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin_user
    redirect_to :back, alert: 'You must be an administrator to access this area.' unless current_user && current_user.is_admin?
  end

  def require_user_is_self_or_admin
    redirect_to :back, alert: 'You are trying to do something goofy, I am afraid.' unless current_user && (current_user.is_admin? || params[:id].to_i == current_user.id)
  end

  helper_method :current_user, :require_admin_user
end
