class AddLoginByGoogleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :login_by_google, :boolean, default: false
  end
end
