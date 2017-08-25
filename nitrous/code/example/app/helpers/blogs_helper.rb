module BlogsHelper
  def sorted_blogs(blogs)
    blogs.sort_by(&:average_rating).reverse
  end
end
