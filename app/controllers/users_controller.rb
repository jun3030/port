class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit_profile, :update_profile, :edit_mypage, :update_mypage, :edit_picture, :update_picture, :upload_instagram]
  before_action :set_instagram_create, only: [:edit_mypage]
  
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
      @user.attributes = { name: user_params[:name], age: user_params[:age], sex: user_params[:sex], purpose_of_use: user_params[:purpose_of_use], 
                           prefecture: user_params[:prefecture], responsible_part: user_params[:responsible_part], genre: user_params[:genre],
                           favorite_artist: user_params[:favorite_artist], self_introduction: user_params[:self_introduction]}
      if @user.save(context: :update_profile)
        flash[:success] = "ユーザー情報を更新しました。"
        redirect_to root_url
      else
        render :edit_profile
      end
  end
  
  def edit_mypage
  
  end
  
  def update_mypage
   
  end
  #　インスタグラムのデータを取り込む
  def upload_instagram
     @user.attributes = { first_token: instagram_params[:first_token], second_token: instagram_params[:second_token], third_token: instagram_params[:third_token], app_id: instagram_params[:app_id], 
                          app_secret: instagram_params[:app_secret], media_count: instagram_params[:media_count]}
    if @user.save(context: :upload_instagram)
      token = @user.first_token
      app_id = @user.app_id
      app_secret = @user.app_secret
       # media_count = @user.media_count
    else
      flash[:danger] = "入力項目が不足しています。"
      render :edit_mypage and return
    end
      res = Net::HTTP.get(URI.parse("https://graph.facebook.com/v3.0/oauth/access_token?grant_type=fb_exchange_token&client_id=#{app_id}&client_secret=#{app_secret}&fb_exchange_token=#{token}"))
      if JSON.parse(res)["access_token"].nil?
        flash[:danger] = "入力情報が正しくありません。"
        render :edit_mypage
      else
        # second_token取得
        second = JSON.parse(res)["access_token"]
        id = Net::HTTP.get(URI.parse("https://graph.facebook.com/v5.0/me?access_token=#{second}"))
        id = JSON.parse(id)["id"]
        third = Net::HTTP.get(URI.parse("https://graph.facebook.com/v5.0/#{id}/accounts?access_token=#{second}"))
        third = JSON.parse(third)
        
        # third_token取得
        @user[:third_token] = third["data"][0]["access_token"]
        @user.save
        
        flash[:info] = "instagramから画像と動画を取り込むためのデータを入力しました。"
        flash[:danger] = "コンテンツが表示されない場合は入力情報を確認してください。"
        redirect_to edit_mypage_url
      end
  end
   
  def edit_picture
    
  end
  
  def update_picture
    if  @user.update(user_params)
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
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :age, :sex, :purpose_of_use, :prefecture, :responsible_part, :genre, :favorite_artist, :self_introduction)
  end
  
  def instagram_params
    params.require(:user).permit(:first_token, :second_token, :third_token, :app_id, :app_secret, :media_count)
  end
  # もし第３トークンを持っているユーザーなら、インスタの画像、動画データをUrlモデルのusers_urlカラムに格納します。
  def set_instagram_create
    if @user.third_token.present? && @user.urls.blank?
      third = @user.third_token
      media_count = @user.media_count
   
      instagram_business_account = Net::HTTP.get(URI.parse("https://graph.facebook.com/v6.0/me?fields=instagram_business_account&access_token=#{third}"))
      instagram_business_account = JSON.parse(instagram_business_account)["instagram_business_account"]["id"]
        
        
      user_media = Net::HTTP.get(URI.parse("https://graph.facebook.com/v3.3/#{instagram_business_account}?fields=name%2Cmedia.limit(#{media_count})%7Bcaption%2Clike_count%2Cmedia_url%2Cpermalink%2Ctimestamp%2Cusername%7D&access_token=#{third}"))
      res = JSON.parse(user_media) 
      res["media"]["data"].each { |insta| @user.urls.create(users_url: insta["media_url"]) }
      
      @instagram = @user.urls.where.not(users_url: nil)
    elsif @user.third_token.present? && @user.urls.present?
      @instagram = @user.urls.where.not(users_url: nil)
    end
  end
 
end
