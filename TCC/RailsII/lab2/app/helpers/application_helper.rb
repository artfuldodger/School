module ApplicationHelper
  def current_user_is_admin?
    current_user && current_user.is_admin?
  end
end
