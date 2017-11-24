class AddReplyToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :reply, :boolean, default: false # defines per defaul that msg goes from user to office
  end
end
