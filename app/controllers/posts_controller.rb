class PostsController < ApplicationController
  
  before_action :set_user, only: [:posts_show, :users_posts]
  before_action :set_post, only: [:posts_show, :users_posts]
  
  def index
    @users = User.all
    @posts = Post.all
  end
  # モーダルウィンドウ
  def posts_show
    
  end
  # 記事投稿画面
  def users_posts
    
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
