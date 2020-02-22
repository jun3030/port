class Url < ApplicationRecord
  belongs_to :user
  
  mount_uploader :mypage_image, ImageUploader
  mount_uploader :mypage_video, VideoUploader
  
end
