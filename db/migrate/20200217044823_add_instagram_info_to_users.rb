class AddInstagramInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_token, :string
    add_column :users, :second_token, :string
    add_column :users, :third_token, :string
    add_column :users, :app_secret, :string
    add_column :users, :media_count, :integer
  end
end
