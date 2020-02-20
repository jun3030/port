class UrlsController < ApplicationController
    before_action :set_user, only: [:users_imaeg_and_video_url]
    
    def users_imaeg_and_video_url
      url_params.each do |id, item|
        url_models_id = Url.find(id)
        url_models_id.update(item)
      end
      
    end
    
    private
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def url_params
      params.require(:user).permit(urls: [:public])[:urls]
    end
    
    
end
