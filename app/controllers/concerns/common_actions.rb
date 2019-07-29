require 'active_support/concern'

module CommonActions
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in_user, :already_liked
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end

  def already_liked
    @post = Post.find(params[:id])
    return true if Like.where(post_id: @post.id)
  end

end