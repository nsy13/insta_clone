class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @post = Post.find(params[:comment][:post_id])
    comment = current_user.comments.build(comment_params)
    if comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
