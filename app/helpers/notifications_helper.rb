module NotificationsHelper
  def unread_count
    Notification.where(user_id: current_user.id, already: false).count
  end

  def avatar(user)
    if user.image
      image_tag user.image
    else
      image_tag user.gravatar_url
    end
  end

  def user(user_id)
    User.find_by(id: user_id)
  end

  def post(post_id)
    Post.find_by(id: post_id)
  end
end