class AddMypageImageAndMovieToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :mypage_image, :string
    add_column :urls, :mypage_movie, :string
  end
end
