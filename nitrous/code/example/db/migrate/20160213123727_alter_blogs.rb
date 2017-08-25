class AlterBlogs < ActiveRecord::Migration
  def up
    if column_exists? :blogs, :user_id
      rename_column :blogs, :user_id, :author_id
    end
  end

  def down
    rename_column :blogs, :author_id, :user_id
  end
end
