class Post < ApplicationRecord
    
    default_scope -> { order(created_at: :desc) } 
    
    belongs_to :user
    mount_uploader :video, VideoUploader
    mount_uploader :posts_image, ImageUploader
    
    validates :title, presence: true
    
end