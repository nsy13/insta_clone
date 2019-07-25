class StaticPagesController < ApplicationController
  def home
    @post = Post.new
  end
end
