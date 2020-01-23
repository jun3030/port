class AddPostsInfoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :favorite_artist, :string
  end
end
