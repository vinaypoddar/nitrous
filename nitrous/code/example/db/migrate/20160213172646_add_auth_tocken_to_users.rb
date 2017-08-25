class AddAuthTockenToUsers < ActiveRecord::Migration
  def up
    unless column_exists? :users, :auth_token
      add_column :users, :auth_token, :string, :null => false, :default => "112200"
      end
  end

  def down
    remove_column :users, :auth_token
  end
end
