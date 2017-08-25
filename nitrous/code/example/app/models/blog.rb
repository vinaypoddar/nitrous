class Blog < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  has_many :ratings
  
  scope :average_rating, lambda {|blog| blog.ratings.map(&:rating).reduce(:+)/blog.ratings.count }

  def average_rating
    return 0 unless ratings.present?
    Blog.average_rating(self)
  end

  def author_name
    author.first_name
  end
end
