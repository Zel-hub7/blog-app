class UsersController < ApplicationController
  def index; 
    @users = User.all
  
  
  end

  def show; 
    @user = User.find(params[:id])
    @post = User.all
  end
end
