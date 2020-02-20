class AddUsersUrlToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :users_url, :string
  end
end
