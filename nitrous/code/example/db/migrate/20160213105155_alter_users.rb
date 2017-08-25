class AlterUsers < ActiveRecord::Migration
  def up
    if column_exists? :users, :password
      rename_column :users, :password, :password_digest
    end
  end

  def down
    rename_column :users, :password_digest, :password
  end
end
