class PostsController < ApplicationController
  before_action :set_user, only: [:edit_profile]
  def index
    @posts = Post.all
  end
  
  def edit_profile
    @user = User.find(params[:user_id])
    
  end
  
  private
  
  def set_user
   @user = User.find(params[:id])
  end
end
