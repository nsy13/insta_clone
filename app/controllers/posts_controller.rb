class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def index
    @posts = Post.page(params[:page]).per(60)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
    flash[:success] = "削除しました"
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:content, { pictures: [] })
    end
end