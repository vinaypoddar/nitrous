class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :blog_id
      t.integer :user_id
    end
  end
end
