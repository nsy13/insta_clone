class StaticPagesController < ApplicationController
  def home
    @feed_items = current_user.feed.page(params[:page]).per(30)
  end
end
