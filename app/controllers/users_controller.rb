class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(30)
    @relationship = Relationship.new
  end

  def show_following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(30)
    render 'users/show'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(30)
    render 'users/show'
  end
end