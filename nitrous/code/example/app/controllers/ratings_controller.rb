class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.blog_id = params[:blog_id]
    if @rating.save
      flash[:notice] = "Rated successfully"
      redirect_to(blog_path(params[:blog_id]))
    else
      flash[:notice] = "Something went wrong.."
      redirect_to(blog_path(params[:blog_id]))
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:user_id, :blog_id, :rating)
  end
end
