class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit_profile, :update_profile, :edit_mypage, :update_mypage, :edit_picture, :update_picture]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user[:image] = "default.png"
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
      redirect_to users_profile_url(@user)
    else
      render :new
    end
  end
  
  def index
    @users = User.all
  end
  
  def edit_profile
    
  end
  
  def update_profile
    if  @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to root_url
    else
      flash[:danger] = "更新できませんでした。"
      render :edit_profile
    end
  end
  
  def edit_mypage
  end
  
  def update_mypage
  end
   
  def edit_picture
    
  end
  
  def update_picture
    if params[:image]
        @user.image = "user_#{@user.id}.png"
        File.binwrite("public/user_images/#{@user.image}", params[:image].read)
    end    
    if @user.save
       flash[:success] = "ユーザー情報を編集しました！"
       redirect_to user_url @user
    else
       render :edit
    end
  end
  
 
  
  private
  
  def set_user
   @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :age, :sex, :purpose_of_use, :prefecture, :responsible_part, :genre, :favorite_artist, :self_introduction)
  end
  
 
end
