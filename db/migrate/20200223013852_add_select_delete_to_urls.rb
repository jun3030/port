class AddSelectDeleteToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :select_content_delete, :boolean
  end
end
