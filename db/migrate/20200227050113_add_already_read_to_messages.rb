class AddAlreadyReadToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :already_read, :string, default: "未読"
  end
end
