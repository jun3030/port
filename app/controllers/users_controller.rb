class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit_profile, :update_profile]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
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
  end
  
  private
  
  def set_user
   @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
