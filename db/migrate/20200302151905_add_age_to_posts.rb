class AddAgeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_age, :integer
  end
end
