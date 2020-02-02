class PostsController < ApplicationController
  
  def index
    @users = User.all
    @posts = Post.all
    @test = ["アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム", "アイテム"]
  end
  
  def posts_show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
  
  private
  
end
