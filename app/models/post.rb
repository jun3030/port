class Post < ApplicationRecord
    belongs_to :user, optional: true
    mount_uploader :video, VideoUploader
    
    validates :title, presence: true
end