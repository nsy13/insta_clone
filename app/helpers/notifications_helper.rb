module NotificationsHelper
  def unread_count
    other_users_notification = Notification.where(user_id: current_user.id, already: false).count
    my_like = Notification.where(user_id: current_user.id,
                                 like_user_id: current_user.id,
                                 already: false).count
    my_comment = Notification.where(user_id: current_user.id,
                                    comment_user_id: current_user.id,
                                    already: false).count
    return (other_users_notification - my_like - my_comment)
  end

  def avatar(user, size)
    if user.image
      image_tag user.image, size: size
    else
      image_tag user.gravatar_url, size: size
    end
  end

  def find_user(user_id)
    User.find_by(id: user_id)
  end

  def find_post(post_id)
    Post.find_by(id: post_id)
  end
end
