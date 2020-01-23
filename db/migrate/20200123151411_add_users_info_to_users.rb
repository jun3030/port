class AddUsersInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :purpose_of_use, :test
    add_column :users, :prefectures, :string
    add_column :users, :responsible_part, :string
    add_column :users, :genre, :string
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :favorite_artist, :string
  end
end
