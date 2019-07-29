class LikesController < ApplicationController
  def create
    @post = Post.find(params[:like][:post_id])
    like = current_user.likes.build(like_params)
    if like.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    like = Like.find(params[:id])
    post = like.post
    like.delete
    redirect_to post_path(post)
  end

  private
    def like_params
      params.require(:like).permit(:user_id, :post_id)
    end
end