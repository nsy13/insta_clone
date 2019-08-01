class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def index
    @posts = Post.page(params[:page]).per(60)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments.all
    @comment = Comment.new
    @likes = @post.likes.all
    @like = Like.new
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