class StaticPagesController < ApplicationController
  def home
    @like = Like.new
    @comment = Comment.new
    if user_signed_in?
      @feed_items = current_user.feed.page(params[:page]).per(30)
    end
  end
end
