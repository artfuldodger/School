module LinksHelper
  def user_should_be_able_to_edit_link?(user, link)
    user && (link.user == user || user.is_at_least_a_moderator?)
  end

  def user_should_be_able_to_delete_link?(user, link)
    user && (link.user == user || user.is_admin?)
  end

  def vote_link_text(link)
    return 'sign in to vote' unless current_user
    link.voted_for_by_users.include?(current_user) ? 'unvote' : 'vote!'
  end

  def user_should_be_able_to_edit_comment?(user, comment)
    user && (comment.user == user || user.is_at_least_a_moderator?)
  end

  def user_should_be_able_to_delete_comment?(user, comment)
    user && (comment.user == user || user.is_admin?)
  end
end
