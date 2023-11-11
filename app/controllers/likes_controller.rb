# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully liked.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to like the post.'
    end
  end
end
