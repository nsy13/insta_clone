class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:comment][:post_id])
    user = @post.user
    comment = current_user.comments.build(comment_params)
    if comment.save
      user.notifications.create(post_id: @post.id, comment_user_id: current_user.id)
      flash[:success] = "コメントを投稿しました"
      redirect_back_or root_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    Notification.find_by(post_id: post.id, comment_user_id: comment.user_id).delete
    comment.delete
    flash[:success] = "コメントを削除しました"
    redirect_back_or root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
