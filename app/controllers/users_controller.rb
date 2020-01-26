class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit_profile, :update_profile]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
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
    if @user.update(profile_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to root_url
    else
      flash[:danger] = "更新できませんでした。"
      render :edit_profile
    end
  end
  
  private
  
  def set_user
   @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def profile_params
    params.require(:user).permit(:name, :age, :sex, :purpose_of_use, :prefecture, :responsible_part, :genre, :favorite_artist, :password, :password_confirmation)
  end
end
