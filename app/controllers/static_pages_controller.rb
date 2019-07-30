class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @feed_items = current_user.feed.page(params[:page]).per(30)
    end
  end
end
