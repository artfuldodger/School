module UsersHelper
  def user_should_be_able_to_edit_user?(user, editable_user)
    user && (editable_user == user || user.is_admin?)
  end
end
