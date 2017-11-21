class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :facebook_picture_url, :string
    rename_column :users, :fist_name, :first_name
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
  end
end
