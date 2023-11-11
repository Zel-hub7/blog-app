# app/controllers/posts_controller.rb

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

  def new
    @post = @user.posts.build
  end

  # app/controllers/posts_controller.rb

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      flash.now[:error] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
