class StaticPagesController < ApplicationController
  def home
    store_location
    @like = Like.new
    @comment = Comment.new
    if user_signed_in?
      @feed_items = current_user.feed.serch(params[:serch]).page(params[:page]).per(30)
    end
  end

  def terms
  end

end