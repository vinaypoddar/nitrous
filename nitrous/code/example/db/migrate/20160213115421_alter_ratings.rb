class AlterRatings < ActiveRecord::Migration
  def up
    add_column :ratings, :rating, :integer
  end
  
  def down
    remove_column :ratings, :rating
  end
end
