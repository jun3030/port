class PostsController < ApplicationController
  
  before_action :set_user, only: [:posts_show, :users_posts, :users_create_posts]
  before_action :set_post, only: [:posts_show]
  
  def index
    @users = User.all
    @posts = Post.all
  end
  # モーダルウィンドウ
  def posts_show
    
  end
  # 記事投稿画面
  def users_posts
    @post = Post.new
  end
  # 記事を作成
  def users_create_posts
    @post = Post.new(user_id: current_user.id, title: post_params[:title], video: post_params[:video])
    if @post.save
      flash[:success] = "記事を投稿しました。"
      redirect_to posts_index_url
    else
      flash[:danger] = "作成に失敗しました。"
      render :index
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :video)
  end
end
