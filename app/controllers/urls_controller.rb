class UrlsController < ApplicationController
    before_action :set_user, only: [:users_imaeg_and_video_url]
    
    # 画像、動画を公開、非公開が選べる
    def users_imaeg_and_video_url
      url_params.each do |id, item|
        url_models_id = Url.find(id)
        url_models_id.update(item)
        
      end 
      flash[:success] = "画像、動画の公開、非公開を変更しました。"
      redirect_to edit_mypage_url
    end
    
    private
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def url_params
      params.require(:user).permit(urls: [:public_url])[:urls]
    end
    
    
end
