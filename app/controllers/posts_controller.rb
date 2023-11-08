class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    # Show the details of an individual post (if needed)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
