class AddPostsImageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :posts_image, :string
  end
end
