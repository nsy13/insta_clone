class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
  end

  def create
    @post = Post.find(params[:like][:post_id])
    user = @post.user
    like = current_user.likes.build(like_params)
    if like.save
      flash[:success] = "お気に入りに追加しました"
      user.notifications.create(post_id: @post.id, like_user_id: current_user.id)
      redirect_back_or root_path
    end
  end

  def destroy
    like = Like.find(params[:id])
    post = like.post
    Notification.find_by(post_id: post.id, like_user_id: like.user_id).delete
    like.delete
    redirect_back_or root_path
  end

  private
    def like_params
      params.require(:like).permit(:user_id, :post_id)
    end
end