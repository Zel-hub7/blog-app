class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comments = @post.comments
    @likes_count = @post.likes_counter
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
