class AddFromKiziToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :from_mypage_data, :string
  end
end
