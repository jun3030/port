class AddPostinfoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :purpose_of_use, :text # 使用目的
    add_column :posts, :prefectures, :string # 都道府県
    add_column :posts, :responsible_part, :string # 担当パート
    add_column :posts, :genre, :string # 好きな音楽ジャンル
    add_column :posts, :age, :integer # 年齢
    add_column :posts, :sex, :string # 性別
  end
end
